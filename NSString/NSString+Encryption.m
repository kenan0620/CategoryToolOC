//
//  NSString+Encryption.m
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import "NSString+Encryption.h"

#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

#include <CoreFoundation/CoreFoundation.h>
#include <stdint.h>
#include <stdio.h>

// Constants
static const size_t FileHashDefaultChunkSizeForReadingData = 4096;

// Function pointer types for functions used in the computation
// of a cryptographic hash.
typedef int (*FileHashInitFunction) (uint8_t *hashObjectPointer[]);
typedef int (*FileHashUpdateFunction) (uint8_t *hashObjectPointer[], const void *data, CC_LONG len);
typedef int (*FileHashFinalFunction) (unsigned char *md, uint8_t *hashObjectPointer[]);

// Structure used to describe a hash computation context.
typedef struct _FileHashComputationContext {
    FileHashInitFunction initFunction;
    FileHashUpdateFunction updateFunction;
    FileHashFinalFunction finalFunction;
    size_t digestLength;
    uint8_t **hashObjectPointer;
} FileHashComputationContext;

#define FileHashComputationContextInitialize(context, hashAlgorithmName)                    \
CC_##hashAlgorithmName##_CTX hashObjectFor##hashAlgorithmName;                          \
context.initFunction      = (FileHashInitFunction)&CC_##hashAlgorithmName##_Init;       \
context.updateFunction    = (FileHashUpdateFunction)&CC_##hashAlgorithmName##_Update;   \
context.finalFunction     = (FileHashFinalFunction)&CC_##hashAlgorithmName##_Final;     \
context.digestLength      = CC_##hashAlgorithmName##_DIGEST_LENGTH;                     \
context.hashObjectPointer = (uint8_t **)&hashObjectFor##hashAlgorithmName

@implementation NSString (Encryption)
- (NSString *)encryption:(EncryptionType )encryptionType{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableString *output;
    
    switch(encryptionType){
        case EncryptionTypeMD5:{
            unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
            CC_MD5(data.bytes, (unsigned int)data.length, outputBuffer);
            output = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH];
            for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
                [output appendFormat:@"%02x",outputBuffer[count]];
            }
        }
            break;
            
        case EncryptionTypeSHA:{
            uint8_t digest[CC_SHA1_DIGEST_LENGTH];
            CC_SHA1(data.bytes, (unsigned int)data.length, digest);
            output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH];
            
            for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
                [output appendFormat:@"%02x", digest[i]];
            }
        }
            break;
            
        case EncryptionTypeSHA256:{
            uint8_t digest[CC_SHA256_DIGEST_LENGTH];
            CC_SHA256(data.bytes, (unsigned int)data.length, digest);
            output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH];
            for(int i=0; i<CC_SHA256_DIGEST_LENGTH; i++) {
                [output appendFormat:@"%02x", digest[i]];
            }
        }
            break;
            
        case EncryptionTypeSHA512:{
            uint8_t digest[CC_SHA512_DIGEST_LENGTH];
            CC_SHA512(data.bytes, (unsigned int)data.length, digest);
            output = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH];
            for(int i=0; i<CC_SHA512_DIGEST_LENGTH; i++) {
                [output appendFormat:@"%02x", digest[i]];
            }
        }
            break;
    }
    
    return output;
}

//MARK: -----------------------File Encryption-----------------------
+ (NSString *)hashOfFileAtPath:(NSString *)filePath
        withComputationContext:(FileHashComputationContext *)context {
    NSString *result = nil;
    if (!filePath) {
        return @"";
    }
    CFURLRef fileURL = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, (CFStringRef)filePath, kCFURLPOSIXPathStyle, (Boolean)false);
    CFReadStreamRef readStream = fileURL ? CFReadStreamCreateWithFile(kCFAllocatorDefault, fileURL) : NULL;
    BOOL didSucceed = readStream ? (BOOL)CFReadStreamOpen(readStream) : NO;
    if (didSucceed) {
        
        // Use default value for the chunk size for reading data.
        const size_t chunkSizeForReadingData = FileHashDefaultChunkSizeForReadingData;
        
        // Initialize the hash object
        (*context->initFunction)(context->hashObjectPointer);
        
        // Feed the data to the hash object.
        BOOL hasMoreData = YES;
        while (hasMoreData) {
            uint8_t buffer[chunkSizeForReadingData];
            CFIndex readBytesCount = CFReadStreamRead(readStream, (UInt8 *)buffer, (CFIndex)sizeof(buffer));
            if (readBytesCount == -1) {
                break;
            } else if (readBytesCount == 0) {
                hasMoreData = NO;
            } else {
                (*context->updateFunction)(context->hashObjectPointer, (const void *)buffer, (CC_LONG)readBytesCount);
            }
        }
        
        // Compute the hash digest
        unsigned char digest[context->digestLength];
        (*context->finalFunction)(digest, context->hashObjectPointer);
        
        // Close the read stream.
        CFReadStreamClose(readStream);
        
        // Proceed if the read operation succeeded.
        didSucceed = !hasMoreData;
        if (didSucceed) {
            char hash[2 * sizeof(digest) + 1];
            for (size_t i = 0; i < sizeof(digest); ++i) {
                snprintf(hash + (2 * i), 3, "%02X", (int)(digest[i]));
            }
            result = [NSString stringWithUTF8String:hash];
        }
    }
    if (readStream) CFRelease(readStream);
    if (fileURL)    CFRelease(fileURL);
    return result;
}

+ (NSString *)encryptionOfFileAtPath:(NSString *)filePath FileEncryptionType:(EncryptionType) encryptionType{
    FileHashComputationContext context;
    switch (encryptionType) {
        case EncryptionTypeMD5:{
            FileHashComputationContextInitialize(context, MD5);
            
        }
            break;
        case EncryptionTypeSHA:{
            FileHashComputationContextInitialize(context, SHA1);
            
        }
            break;
        case EncryptionTypeSHA256:{
            FileHashComputationContextInitialize(context, SHA256);
            
        }
            break;
        case EncryptionTypeSHA512:{
            FileHashComputationContextInitialize(context, SHA512);
            
        }
            break;
    }
    return [self hashOfFileAtPath:filePath withComputationContext:&context];
}

- (NSString *)encodeDesCBC:(NSString *)key
                        IV:(const void *)iv{
    if (!self || self.length < 1) {
        return @"";
    }
    NSData*data;
    NSData *textData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [textData length];
    unsigned char buffer[1024];
    memset(buffer,0,sizeof(char));
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding ,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [textData bytes],
                                          dataLength,
                                          buffer,1024,
                                          &numBytesEncrypted);
    
    if(cryptStatus ==kCCSuccess) {
        data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
    }
    NSString *result = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    return result;
}

- (NSString *)decodeDesCBC:(NSString *)key
                        IV:(const void *)iv{
    if (!self || self.length < 1) {
        return @"";
    }
    NSData *cipherdata = [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    unsigned char buffer[1024];
    memset(buffer,0,sizeof(char));
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding ,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherdata bytes],
                                          [cipherdata length],
                                          buffer,1024,
                                          &numBytesDecrypted);
    NSString *result = @"";
    if (cryptStatus ==kCCSuccess) {
        NSData*plaindata = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        result = [[NSString alloc]initWithData:plaindata encoding:NSUTF8StringEncoding];
    }
    
    return result;
}

- (NSString *)encodeDesECB:(NSString *)key{
    if (!self || self.length < 1) {
        return @"";
    }
    NSData*data;
    NSData *textData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [textData length];
    unsigned char buffer[1024];
    memset(buffer,0,sizeof(char));
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding| kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          nil,
                                          [textData bytes],
                                          dataLength,
                                          buffer,1024,
                                          &numBytesEncrypted);
    
    if(cryptStatus ==kCCSuccess) {
        data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
    }
    NSString *result = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    return result;
}

- (NSString *)decodeDesECB:(NSString *)key{
    if (!self || self.length < 1) {
        return @"";
    }
    NSData *cipherdata = [[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    unsigned char buffer[1024];
    memset(buffer,0,sizeof(char));
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding| kCCOptionECBMode ,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          nil,
                                          [cipherdata bytes],
                                          [cipherdata length],
                                          buffer,1024,
                                          &numBytesDecrypted);
    NSString *result = @"";
    if (cryptStatus ==kCCSuccess) {
        NSData*plaindata = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        result = [[NSString alloc]initWithData:plaindata encoding:NSUTF8StringEncoding];
    }
    
    return result;
}
@end
