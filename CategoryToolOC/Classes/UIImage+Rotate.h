//
//  UIImage+Rotate.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Rotate)
/**
 纠正图片的方向
 
 */
- (UIImage *)fixOrientation;

/**
 按给定的方向旋转图片
 
 @param orient 旋转方向
 */
- (UIImage*)rotate:(UIImageOrientation)orient;

/**
 垂直翻转
 
 */
- (UIImage *)flipVertical;

/**
 水平翻转
 
 */
- (UIImage *)flipHorizontal;

/**
 将图片旋转degrees角度
 
 @param degrees 旋转角度
 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

/**
 将图片旋转radians弧度
 
 @param radians 旋转弧度
 */
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
@end

NS_ASSUME_NONNULL_END
