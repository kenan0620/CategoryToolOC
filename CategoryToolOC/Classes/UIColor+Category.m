//
//  UIColor+Category.m
//  CategoryToolOC
//
//  Created by zsn on 2022/7/16.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)
+ (UIColor *)colorGradientChangeWithSize:(CGSize)size
                               direction:(GradientChangeDirection)direction
                              startColor:(UIColor*)startcolor
                                endColor:(UIColor*)endColor{
    if(CGSizeEqualToSize(size,CGSizeZero) || !startcolor || !endColor) {
            return [UIColor clearColor];
        }
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame=CGRectMake(0,0, size.width, size.height);
        CGPoint startPoint = CGPointZero;
        if (direction == GradientChangeDirectionDownDiagonalLine) {
            startPoint = CGPointMake(0.0,1.0);
        }
        gradientLayer.startPoint = startPoint;
        CGPoint endPoint = CGPointZero;
        switch(direction) {
            case GradientChangeDirectionLevel:
                endPoint = CGPointMake(1.0,0.0);
                break;
            case GradientChangeDirectionVertical:
                endPoint = CGPointMake(0.0,1.0);
                break;
            case GradientChangeDirectionUpwardDiagonalLine:
                endPoint = CGPointMake(1.0,1.0);
                break;
            case GradientChangeDirectionDownDiagonalLine:
                endPoint = CGPointMake(1.0,0.0);
                break;
            default:
                break;
        }
        gradientLayer.endPoint = endPoint;
        gradientLayer.colors = @[(id)startcolor.CGColor, (id)endColor.CGColor];
        UIGraphicsBeginImageContext(size);
        [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return [UIColor colorWithPatternImage:image];
}

+ (UIColor *)colorHex:(NSString *)hexString{
    return [self colorHex:hexString alpha:1.0];
}

+ (UIColor *)colorHex:(NSString *)hexString alpha:(CGFloat)alpha{
    if ([hexString hasPrefix:@"#"]) {
            hexString = [hexString substringFromIndex:1];
        }
        if ([[hexString lowercaseString] hasPrefix:@"0x"]) {
            hexString = [hexString substringFromIndex:2];
        }
        if ([hexString length] != 6) {
            return [UIColor clearColor];
        }
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexString];
        unsigned hexValue = 0;
        if ([scanner scanHexInt:&hexValue] && [scanner isAtEnd]) {
            int r = ((hexValue & 0xFF0000) >> 16);
            int g = ((hexValue & 0x00FF00) >>  8);
            int b = ( hexValue & 0x0000FF)       ;
            return [self colorWithRed:((float)r / 255)
                                green:((float)g / 255)
                                 blue:((float)b / 255)
                                alpha:alpha];
        }
        return [UIColor clearColor];
}
@end
