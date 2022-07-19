//
//  UIImage+Larger.m
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/19.
//

#import "UIImage+Larger.h"

@implementation UIImage (Larger)
+ (UIImage *)largerImage:(NSString *)imageName{
    return  [UIImage largerImage:imageName ImageType:@"png"];
}

+ (UIImage *)largerImage:(NSString *)imageName ImageType:(NSString *)type{
    if (!imageName || imageName.length < 1) {
        return  [[UIImage alloc] init];
    }
    if (!type || type.length < 1) {
        type = @"png";
    }
    NSString *filePath = [[NSBundle mainBundle] pathForResource:imageName ofType:type];
    
    return  [UIImage imageWithContentsOfFile:filePath];
}
@end
