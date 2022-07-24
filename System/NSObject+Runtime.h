//
//  NSObject+Runtime.h
//  CategoryToolOC
//
//  Created by zsn on 2022/7/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Runtime)
/**
 Adds a new instance method to a class. All instances of this class will have this method.
 
 The block captures `self` in the calling context. To allow access to the instance from within the block it is passed as parameter to the block.
 @param selectorName The name of the method.
 @param block The block to execute for the instance method, a pointer to the instance is passed as the only parameter.
 @returns `YES` if the operation was successful
 */
+ (BOOL)addInstanceMethodWithSelectorName:(NSString *)selectorName block:(void (^)(id))block;

/**-------------------------------------------------------------------------------------
 @name Method Swizzling
 ---------------------------------------------------------------------------------------
 */

/**
 实例方法交换
 
 @param selector 方法
 @param otherSelector 方法
 */
+ (void)swizzleMethod:(SEL)selector withMethod:(SEL)otherSelector;

/**
 类方法交换
 
 @param selector 方法
 @param otherSelector 方法
 */
+ (void)swizzleClassMethod:(SEL)selector withMethod:(SEL)otherSelector;

#pragma mark - Associate value

/**
 Associate one object to `self`, as if it was a strong property (strong, nonatomic).
 
 @param value   The object to associate.
 @param key     The pointer to get value from `self`.
 */
- (void)setAssociateValue:(nullable id)value withKey:(void *)key;

/**
 Associate one object to `self`, as if it was a weak property (week, nonatomic).
 
 @param value  The object to associate.
 @param key    The pointer to get value from `self`.
 */
- (void)setAssociateWeakValue:(nullable id)value withKey:(void *)key;

/**
 Associate one object to `self`, as if it was a weak property (copy, nonatomic).
 
 @param value  The object to associate.
 @param key    The pointer to get value from `self`.
 */
- (void)setAssociateCopyValue:(nullable id)value withKey:(void *)key;

/**
 Get the associated value from `self`.
 
 @param key The pointer to get value from `self`.
 */
- (nullable id)associatedValueForKey:(void *)key;

/**
 Remove all associated values.
 */
- (void)removeAssociatedValues;

/// 类名
+ (NSString *)className;

/// 类名
- (NSString *)className;

/// 实例属性字典
- (NSDictionary *)propertyDictionary;

/// 属性名称列表
- (NSArray *)propertyKeys;
+ (NSArray *)propertyKeys;

/// 属性详细信息列表
- (NSArray *)propertiesInfo;
+ (NSArray *)propertiesInfo;

/// 格式化后的属性列表
+ (NSArray *)propertiesWithCodeFormat;

/// 方法列表
- (NSArray *)methodList;
+ (NSArray *)methodList;

- (NSArray *)methodListInfo;

/// 深拷贝
- (nullable id)deepCopy;

/**
 Returns a copy of the instance use archiver and unarchiver.
 Returns nil if an error occurs.
 
 @param archiver   NSKeyedArchiver class or any class inherited.
 @param unarchiver NSKeyedUnarchiver clsas or any class inherited.
 */
- (nullable id)deepCopyWithArchiver:(Class)archiver unarchiver:(Class)unarchiver;
@end

NS_ASSUME_NONNULL_END
