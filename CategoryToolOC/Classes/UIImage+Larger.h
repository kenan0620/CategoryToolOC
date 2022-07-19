//
//  UIImage+Larger.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Larger)
/**
 本地大图加载 (默认png类型)
 
 @param imageName 本地图片名称
 */
+ (UIImage *)largerImage:(NSString *)imageName;

/**
 本地大图加载
 
 @param imageName 本地图片名称
 @param type 本地图片类型后缀
 */
+ (UIImage *)largerImage:(NSString *)imageName ImageType:(NSString *)type;
@end

NS_ASSUME_NONNULL_END
