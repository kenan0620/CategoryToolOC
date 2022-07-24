//
//  KeyChain.h
//  CategoryToolOC
//
//  Created by zsn on 2022/7/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KeyChain : NSObject
/**
 保存
 
 @param key  关键字
 @param data  存储内容
 */
+ (void)save:(NSString *)key data:(id)data;

/**
 获取
 
 @param key  关键字
 */
+ (id)load:(NSString *)key;

/**
 删除
 
 @param key  关键字
 */
+ (void)deleteKeyData:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
