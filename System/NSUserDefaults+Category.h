//
//  NSUserDefaults+Category.h
//  CategoryToolOC
//
//  Created by zsn on 2022/7/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (Category)
/**
 iCloud 写入
 
 @param value 内容
 @param key key
 @param sync 同步云
 */
- (void)setValue:(id)value
          forKey:(NSString *)key
      iCloudSync:(BOOL)sync;

/**
 iCloud 写入
 
 @param value 内容
 @param key key
 @param sync 同步云
 */
- (void)setObject:(id)value
           forKey:(NSString *)key
       iCloudSync:(BOOL)sync;

/**
 iCloud 读取
 
 @param key key
 @param sync 同步云
 */
- (id)valueForKey:(NSString *)key
       iCloudSync:(BOOL)sync;

/**
 iCloud 读取
 
 @param key key
 @param sync 同步云
 */
- (id)objectForKey:(NSString *)key
        iCloudSync:(BOOL)sync;

/**
 iCloud 同步
 
 @param sync 同步云
 */
- (BOOL)synchronizeAlsoiCloudSync:(BOOL)sync;

/**
 NSUserDefaults 读取 NSString
 
 @param key key
 */
+ (NSString *)stringForKey:(NSString *)key;

/**
 NSUserDefaults 读取 NSArray
 
 @param key key
 */
+ (NSArray *)arrayForKey:(NSString *)key;

/**
 NSUserDefaults 读取 NSDictionary
 
 @param key key
 */
+ (NSDictionary *)dictionaryForKey:(NSString *)key;

/**
 NSUserDefaults 读取 NSData
 
 @param key key
 */
+ (NSData *)dataForKey:(NSString *)key;

/**
 NSUserDefaults 读取 NSArray
 
 @param key key
 */
+ (NSArray *)stringArrayForKey:(NSString *)key;

/**
 NSUserDefaults 读取 NSInteger
 
 @param key key
 */
+ (NSInteger)integerForKey:(NSString *)key;

/**
 NSUserDefaults 读取 float
 
 @param key key
 */
+ (float)floatForKey:(NSString *)key;

/**
 NSUserDefaults 读取 double
 
 @param key key
 */
+ (double)doubleForKey:(NSString *)key;

/**
 NSUserDefaults 读取 BOOL
 
 @param key key
 */
+ (BOOL)boolForKey:(NSString *)key;

/**
 NSUserDefaults 读取 NSURL
 
 @param key key
 */
+ (NSURL *)URLForKey:(NSString *)key;

/**
 NSUserDefaults 写入
 
 @param value 内容
 @param key key
 */
+ (void)setObject:(id)value
           forKey:(NSString *)key;

/**
 解档
 
 @param key key
 */
+ (id)archiverObjectForKey:(NSString *)key;

/**
 归档
 
 @param value 内容
 @param key key
 */
+ (void)setArchiverObject:(id)value
                   forKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
