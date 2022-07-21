//
//  NSString+Calculate.m
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import "NSString+Calculate.h"

@implementation NSString (Calculate)
/// 计算类型
typedef enum : NSUInteger {
    /// 加法计算
    CalculateAdding,
    /// 减法计算
    CalculateSubtracting,
    /// 乘法计算
    CalculateMultiplying,
    /// 除法计算
    CalculateDividing
} CalculateType;

@implementation NSString (LTM_Calculate)

- (NSComparisonResult)stringCompare:(NSString *)compareString{
    NSDecimalNumber *selfNumber = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *compareNumber = [NSDecimalNumber decimalNumberWithString:compareString];
    
    return [selfNumber compare:compareNumber];
}

- (NSString *)adding:(NSString *)string{
    return [self adding:string
           RoundingMode:NSRoundPlain];
}

- (NSString *)adding:(NSString *)string
        RoundingMode:(NSRoundingMode)mode{
    return [self adding:string
           RoundingMode:mode
                  Scale:2];
}

- (NSString *)adding:(NSString *)string
        RoundingMode:(NSRoundingMode)mode
               Scale:(NSInteger)scale{
    return [self stringByCalculateType:(CalculateAdding)
                                String:string
                                  Mode:mode
                                 scale:scale];
}

- (NSString *)subtracting:(NSString *)string{
    return [self subtracting:string
                RoundingMode:NSRoundPlain];
}

- (NSString *)subtracting:(NSString *)string
             RoundingMode:(NSRoundingMode)mode{
    return [self subtracting:string
                RoundingMode:mode
                       Scale:2];
}

- (NSString *)subtracting:(NSString *)string
             RoundingMode:(NSRoundingMode)mode
                    Scale:(NSInteger)scale{
    return [self stringByCalculateType:(CalculateSubtracting)
                                String:string
                                  Mode:mode
                                 scale:scale];
}

- (NSString *)multiplying:(NSString *)string{
    return [self multiplying:string
                RoundingMode:NSRoundPlain];
}

- (NSString *)multiplying:(NSString *)string
             RoundingMode:(NSRoundingMode)mode{
    return [self multiplying:string
                RoundingMode:mode
                       Scale:2];
}

- (NSString *)multiplying:(NSString *)string
             RoundingMode:(NSRoundingMode)mode
                    Scale:(NSInteger)scale{
    return [self stringByCalculateType:(CalculateMultiplying)
                                String:string
                                  Mode:mode
                                 scale:scale];
}

- (NSString *)dividing:(NSString *)string{
    return [self dividing:string
             RoundingMode:NSRoundPlain];
}

- (NSString *)dividing:(NSString *)string
          RoundingMode:(NSRoundingMode)mode{
    return [self dividing:string
             RoundingMode:mode
                    Scale:2];
}

- (NSString *)dividing:(NSString *)string
          RoundingMode:(NSRoundingMode)mode
                 Scale:(NSInteger)scale{
    return [self stringByCalculateType:(CalculateDividing)
                                String:string
                                  Mode:mode
                                 scale:scale];
}

//MARK: 数字运算

/**
 字符串计算
 
 @param type 运算符类型
 @param string 被运算内容
 @param mode 四舍五入的方式
 @param scale 保留小数位数
 
 @return 计算后结果
 */
- (NSString *)stringByCalculateType:(CalculateType)type
                             String:(NSString *)string
                               Mode:(NSRoundingMode)mode
                              scale:(NSUInteger)scale{
    
    NSDecimalNumber *selfNumber;
    if (self.length == 0) {
        selfNumber = [NSDecimalNumber decimalNumberWithString:@"0"];
    } else {
        selfNumber = [NSDecimalNumber decimalNumberWithString:self];
    }
    
    NSDecimalNumber *calculateNumber = [NSDecimalNumber decimalNumberWithString:string];
    NSDecimalNumberHandler *behavior = [[NSDecimalNumberHandler alloc] initWithRoundingMode:mode scale:scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    
    NSDecimalNumber *result = nil;
    switch (type) {
        case CalculateAdding:
            result = [selfNumber decimalNumberByAdding:calculateNumber withBehavior:behavior];
            break;
        case CalculateSubtracting:
            result =  [selfNumber decimalNumberBySubtracting:calculateNumber withBehavior:behavior];
            break;
        case CalculateMultiplying:
            result = [selfNumber decimalNumberByMultiplyingBy:calculateNumber withBehavior:behavior];
            break;
        case CalculateDividing:
            result =[selfNumber decimalNumberByDividingBy:calculateNumber withBehavior:behavior];
            break;
    }
    
    //  使用formatter
    NSNumberFormatter *numberFormatter = [self stringFormatterWithScale:scale];
    NSString *resultString = [numberFormatter stringFromNumber:result];
    
    if ([resultString isEqualToString:@"NaN"]) {
        resultString = 0;
    }
    
    return resultString;
}

/**
 字符串格式化
 
 @param scale 保留小数位数
 */
- (NSNumberFormatter *)stringFormatterWithScale:(NSInteger)scale{
    static NSNumberFormatter *numberFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.minimumIntegerDigits = 1;
        numberFormatter.numberStyle = NSNumberFormatterNoStyle;
    });
    numberFormatter.alwaysShowsDecimalSeparator = !(scale == 0);
    numberFormatter.minimumFractionDigits = scale;
    
    return numberFormatter;
}
@end
