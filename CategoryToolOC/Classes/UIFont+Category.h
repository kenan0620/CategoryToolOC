//
//  UIFont+Category.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (Category)
/**
 系统Medium字体
 
 @param fontSize 字号
 */
+ (UIFont *)systemMediumFont:(CGFloat )fontSize;

/**
 系统Semibold字体
 
 @param fontSize 字号
 */
+ (UIFont *)systemSemiboldFont:(CGFloat )fontSize;

/**
 系统Light字体
 
 @param fontSize 字号
 */
+ (UIFont *)systemLightFont:(CGFloat )fontSize;

/**
 系统Ultralight字体
 
 @param fontSize 字号
 */
+ (UIFont *)systemUltralightFont:(CGFloat )fontSize;

/**
 系统Regular字体
 
 @param fontSize 字号
 */
+ (UIFont *)systemRegularFont:(CGFloat )fontSize;

/**
 系统Thin字体
 
 @param fontSize 字号
 */
+ (UIFont *)systemThinFont:(CGFloat )fontSize;
@end

NS_ASSUME_NONNULL_END
