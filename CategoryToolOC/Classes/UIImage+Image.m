//
//  UIImage+Image.m
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/19.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)
- (UIImage *)imageWithWaterMarkText:(nullable NSString *)text
                          TextPoint:(CGPoint)point
                   AttributedString:(nullable NSDictionary *)attributed{
    //1.开启上下文  尺寸 / 透明度 / 缩放
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    //2.绘制图片
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    //添加水印文字
    [text drawAtPoint:point withAttributes:attributed];
    //3.从上下文中获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //4.关闭图形上下文
    UIGraphicsEndImageContext();
    //返回图片
    return newImage;
}

- (UIImage *)imageWithWaterMarkImage:(nullable UIImage *)markImage{
    if (!markImage) { return self; }
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    CGFloat scale = 0.3;
    CGFloat margin = 5;
    CGFloat waterW = markImage.size.width * scale;
    CGFloat waterH = markImage.size.height * scale;
    CGFloat waterX = self.size.width - waterW - margin;
    CGFloat waterY = self.size.height - waterH - margin;
    [markImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)imageCircular{
    //开启图片上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    //裁切范围
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    [path addClip];
    //绘制图片
    [self drawAtPoint:CGPointZero];
    //从上下文中获得裁切好的图片
    UIImage *cricleImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图片上下文
    UIGraphicsEndImageContext();
    return cricleImage;
}

- (UIImage *)imageCircularBorder:(CGFloat)borderWidth
                           Color:(nonnull UIColor *)borderColor{
    //定义尺寸, 图片的尺寸 + 边框的尺寸
    CGSize size = CGSizeMake(self.size.width + 2 * borderWidth, self.size.height + 2 * borderWidth);
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    //绘制大圆 作为边框填充
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [borderColor set];
    [path fill];
    //绘制小圆,裁剪图片
    UIBezierPath *imgPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, self.size.width, self.size.height)];
    //添加裁剪区域
    [imgPath addClip];
    //把图片绘制到上下文当中
    [self drawAtPoint:CGPointMake(borderWidth, borderWidth)];
    //从上下文当中取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return newImage;
}
@end
