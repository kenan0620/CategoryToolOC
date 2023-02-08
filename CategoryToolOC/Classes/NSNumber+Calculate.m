//
//  NSNumber+Calculate.m
//  CategoryToolOC
//
//  Created by 柯南 on 2023/2/8.
//

#import "NSNumber+Calculate.h"

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

@implementation NSNumber (Calculate)

- (NSComparisonResult)numberCompare:(NSNumber *)number{
    NSDecimalNumber *selfNumber = [NSDecimalNumber decimalNumberWithString:self.stringValue];
    NSDecimalNumber *compareNumber = [NSDecimalNumber decimalNumberWithString:number.stringValue];
    
    return [selfNumber compare:compareNumber];
}

- (NSString *)adding:(NSNumber *)number{
    return [self adding:number
           RoundingMode:NSRoundPlain];
}

- (NSString *)adding:(NSNumber *)number
        RoundingMode:(NSRoundingMode)mode{
    return [self adding:number
           RoundingMode:mode
                  Scale:2];
}

- (NSString *)adding:(NSNumber *)number
        RoundingMode:(NSRoundingMode)mode
               Scale:(NSInteger)scale{
    return [self calculateType:(CalculateAdding)
                                String:number
                                  Mode:mode
                                 scale:scale];
}

- (NSString *)subtracting:(NSNumber *)number{
    return [self subtracting:number
                RoundingMode:NSRoundPlain];
}

- (NSString *)subtracting:(NSNumber *)number
             RoundingMode:(NSRoundingMode)mode{
    return [self subtracting:number
                RoundingMode:mode
                       Scale:2];
}

- (NSString *)subtracting:(NSNumber *)number
             RoundingMode:(NSRoundingMode)mode
                    Scale:(NSInteger)scale{
    return [self calculateType:(CalculateSubtracting)
                                String:number
                                  Mode:mode
                                 scale:scale];
}

- (NSString *)multiplying:(NSNumber *)number{
    return [self multiplying:number
                RoundingMode:NSRoundPlain];
}

- (NSString *)multiplying:(NSNumber *)number
             RoundingMode:(NSRoundingMode)mode{
    return [self multiplying:number
                RoundingMode:mode
                       Scale:2];
}

- (NSString *)multiplying:(NSNumber *)number
             RoundingMode:(NSRoundingMode)mode
                    Scale:(NSInteger)scale{
    return [self calculateType:(CalculateMultiplying)
                                String:number
                                  Mode:mode
                                 scale:scale];
}

- (NSString *)dividing:(NSNumber *)number{
    return [self dividing:number
             RoundingMode:NSRoundPlain];
}

- (NSString *)dividing:(NSNumber *)number
          RoundingMode:(NSRoundingMode)mode{
    return [self dividing:number
             RoundingMode:mode
                    Scale:2];
}

- (NSString *)dividing:(NSNumber *)number
          RoundingMode:(NSRoundingMode)mode
                 Scale:(NSInteger)scale{
    return [self calculateType:(CalculateDividing)
                                String:number
                                  Mode:mode
                                 scale:scale];
}

//MARK: 数字运算

/**
 字符串计算
 
 @param type 运算符类型
 @param number 被运算内容
 @param mode 四舍五入的方式
 @param scale 保留小数位数
 
 @return 计算后结果
 */
- (NSString *)calculateType:(CalculateType)type
                             String:(NSNumber *)number
                               Mode:(NSRoundingMode)mode
                              scale:(NSUInteger)scale{
    
    NSDecimalNumber *selfNumber = [NSDecimalNumber decimalNumberWithString:self.stringValue];
    
    NSDecimalNumber *calculateNumber = [NSDecimalNumber decimalNumberWithString:number.stringValue];
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
