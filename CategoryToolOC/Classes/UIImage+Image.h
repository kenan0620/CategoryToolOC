//
//  UIImage+Image.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Image)
/**
 给图片添加文字水印
 
 @param text 水印文字
 @param point 添加位置
 @param attributed 文字的富文本属性
 */
- (UIImage *)imageWithWaterMarkText:(nullable NSString *)text
                          TextPoint:(CGPoint)point
                   AttributedString:(nullable NSDictionary *)attributed;

/**
 给图片添加图片水印
 
 @param markImage 水印图片
 */
- (UIImage *)imageWithWaterMarkImage:(nullable UIImage *)markImage;

/**
 获得裁剪后的圆形图片 如果图片是长方形,则获得椭圆形图片
 */
- (UIImage *)imageCircular;

/**
 获得裁剪后的圆形图片带边框
 
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 */
- (UIImage *)imageCircularBorder:(CGFloat)borderWidth
                           Color:(nonnull UIColor *)borderColor;
@end

NS_ASSUME_NONNULL_END
