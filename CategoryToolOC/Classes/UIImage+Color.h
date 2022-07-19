//
//  UIImage+Color.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Color)
/**
 根据颜色生成纯色图片
 
 @param color 颜色
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 取图片某一像素的颜色
 
 @param point 颜色点
 */
- (UIColor *)colorAtPixel:(CGPoint)point;

/**
 获得灰度图
 
 */
- (UIImage *)convertToGrayImage;
@end

NS_ASSUME_NONNULL_END
