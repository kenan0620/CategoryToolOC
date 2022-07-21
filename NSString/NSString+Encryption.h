//
//  NSString+Encryption.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 加密类型
typedef enum : NSUInteger {
    EncryptionTypeMD5,
    EncryptionTypeSHA,
    EncryptionTypeSHA256,
    EncryptionTypeSHA512
} EncryptionType;

@interface NSString (Encryption)

/**
 字符串加密

 @param encryptionType 加密类型
 */
- (NSString *)encryption:(EncryptionType )encryptionType;
/**
 文件加密
 
 @param filePath 文件路径
 @param encryptionType 加密类型
 */
+ (NSString *)encryptionOfFileAtPath:(NSString *)filePath
                  FileEncryptionType:(EncryptionType )encryptionType;

/**
 DES CBC方式加密
 
 @param key 密钥
 @param iv 偏移
 */
- (NSString *)encodeDesCBC:(NSString *)key
                        IV:(const void *)iv;

/**
 DES CBC方式解密
 
 @param key 密钥
 @param iv 偏移
 */
- (NSString *)decodeDesCBC:(NSString *)key
                        IV:(const void *)iv;

/**
 DES ECB方式加密
 
 @param key 密钥
 */
- (NSString *)encodeDesECB:(NSString *)key;

/**
 DES ECB方式解密
 
 @param key 密钥
 */
- (NSString *)decodeDesECB:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
