//
//  UIImage+Gif.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Gif)
/**
 用一个Gif生成UIImage，传入一个GIFData
 
 @param data GIF数据源
 */
+ (UIImage *)animatedImageWithAnimatedGIFData:(NSData *)data;

/**
 用一个Gif生成UIImage，传入一个GIF路径
 
 @param url GIF URL
 */
+ (UIImage *)animatedImageWithAnimatedGIFURL:(NSURL *)url;
@end

NS_ASSUME_NONNULL_END
