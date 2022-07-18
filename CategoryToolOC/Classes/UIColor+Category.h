//
//  UIColor+Category.h
//  CategoryToolOC
//
//  Created by zsn on 2022/7/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, GradientChangeDirection) {
    /// 水平方向渐变
    GradientChangeDirectionLevel,
    /// 垂直方向渐变
    GradientChangeDirectionVertical,
    /// 主对角线方向渐变
    GradientChangeDirectionUpwardDiagonalLine,
    /// 副对角线方向渐变
    GradientChangeDirectionDownDiagonalLine,
};

@interface UIColor (Category)
/*
 设置渐变颜色
 
 @param size 渐变区域的尺寸
 @param direction 渐变方向
 @param startColor 开始颜色
 @param endColor 结束颜色
 */
+ (UIColor *)colorGradientChangeWithSize:(CGSize)size
                               direction:(GradientChangeDirection)direction
                              startColor:(UIColor*)startcolor
                                endColor:(UIColor*)endColor;

/*
 设置颜色
 
 @param hexString 色值
 */
+ (UIColor *)colorHex:(NSString *)hexString;

/*
 设置颜色
 
 @param hexString 色值
 @param alpha 透明度
 */
+ (UIColor *)colorHex:(NSString *)hexString alpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
