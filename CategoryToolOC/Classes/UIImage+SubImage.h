//
//  UIImage+SubImage.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SubImage)
/**
 截取当前image对象rect区域内的图像
 
 @param rect 子图区域
 */
- (UIImage *)subImageWithRect:(CGRect)rect;

/**
 压缩图片至指定尺寸
 
 @param size 尺寸
 */
- (UIImage *)rescaleImageToSize:(CGSize)size;

/**
 压缩图片至指定像素
 
 @param toPX 像素
 */
- (UIImage *)rescaleImageToPX:(CGFloat )toPX;

/**
 压缩图片质量 达到指定大小
 
 @param maxLength 图片最大字节
 */
- (UIImage *)compressQualityWithMaxLength:(NSInteger)maxLength;

/**
 压缩图片尺寸 达到指定大小
 
 @param maxLength 图片最大字节
 */
- (UIImage *)compressBySizeWithMaxLength:(NSUInteger)maxLength;


/**
 在指定的size里面生成一张平铺的图片
 
 @param size 尺寸
 */
- (UIImage *)getTiledImageWithSize:(CGSize)size;

/**
 View生成图片
 
 @param view 视图
 */
+ (UIImage *)imageFromView:(UIView *)view;

/**
 将两个图片合成一张图片
 
 @param firstImage 图片源
 @param secondImage 图片源
 */
+ (UIImage*)mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;
@end

NS_ASSUME_NONNULL_END
