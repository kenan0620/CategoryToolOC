//
//  UIFont+Category.m
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import "UIFont+Category.h"

@implementation UIFont (Category)
+ (UIFont *)systemMediumFont:(CGFloat )fontSize{
    return [UIFont systemFontOfSize:fontSize weight:(UIFontWeightMedium)];
}

+ (UIFont *)systemSemiboldFont:(CGFloat )fontSize{
    return [UIFont systemFontOfSize:fontSize weight:(UIFontWeightSemibold)];
}

+ (UIFont *)systemLightFont:(CGFloat )fontSize{
    return [UIFont systemFontOfSize:fontSize weight:(UIFontWeightLight)];
}

+ (UIFont *)systemUltralightFont:(CGFloat )fontSize{
    return [UIFont systemFontOfSize:fontSize weight:(UIFontWeightUltraLight)];
}

+ (UIFont *)systemRegularFont:(CGFloat )fontSize{
    return [UIFont systemFontOfSize:fontSize weight:(UIFontWeightRegular)];
}

+ (UIFont *)systemThinFont:(CGFloat )fontSize{
    return [UIFont systemFontOfSize:fontSize weight:(UIFontWeightThin)];
}
@end
