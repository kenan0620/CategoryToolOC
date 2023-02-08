//
//  NSNumber+Calculate.m
//  CategoryToolOC
//
//  Created by 柯南 on 2023/2/8.
//

#import "NSNumber+Calculate.h"

@implementation NSNumber (Calculate)

- (NSComparisonResult)numberCompare:(NSNumber *)number{
    NSDecimalNumber *selfNumber = [NSDecimalNumber decimalNumberWithString:self.stringValue];
    NSDecimalNumber *compareNumber = [NSDecimalNumber decimalNumberWithString:number.stringValue];
    
    return [selfNumber compare:compareNumber];
}

- (NSNumber *)adding:(NSNumber *)number{
    NSDecimalNumber *number1 = [NSDecimalNumber decimalNumberWithString:self.stringValue];
    NSDecimalNumber *number2 = [NSDecimalNumber decimalNumberWithString:number.stringValue];
    
    return [number1 decimalNumberByAdding:number2];
}

- (NSNumber *)subtracting:(NSNumber *)number{
    NSDecimalNumber *number1 = [NSDecimalNumber decimalNumberWithString:self.stringValue];
    NSDecimalNumber *number2 = [NSDecimalNumber decimalNumberWithString:number.stringValue];
    
    return [number1 decimalNumberBySubtracting:number2];
}

- (NSNumber *)multiplying:(NSNumber *)number{
    NSDecimalNumber *number1 = [NSDecimalNumber decimalNumberWithString:self.stringValue];
    NSDecimalNumber *number2 = [NSDecimalNumber decimalNumberWithString:number.stringValue];
    
    return [number1 decimalNumberByMultiplyingBy:number2];
}

- (NSNumber *)dividing:(NSNumber *)number{
    NSDecimalNumber *number1 = [NSDecimalNumber decimalNumberWithString:self.stringValue];
    NSDecimalNumber *number2 = [NSDecimalNumber decimalNumberWithString:number.stringValue];
    
    return [number1 decimalNumberByDividingBy:number2];
}

- (NSString *)decimalDigit:(int)digit{
    return  [self decimalHasDigit:digit Mode:NSNumberFormatterRoundHalfUp HasComma:true];
}

- (NSString *)decimalDigitParam:(int)digit{
    return  [self decimalHasDigit:digit Mode:NSNumberFormatterRoundHalfUp HasComma:false];
}

- (NSString *)decimalHasDigit:(int)digit
                         Mode:(NSNumberFormatterRoundingMode)mode
                     HasComma:(BOOL)hasComma{
    NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
    format.numberStyle = hasComma == true? NSNumberFormatterDecimalStyle : NSNumberFormatterNoStyle;
    format.minimumFractionDigits = digit;
    format.maximumFractionDigits = digit;
    format.formatterBehavior = NSNumberFormatterBehaviorDefault;
    format.roundingMode = mode;
    
    return  [format stringFromNumber:self];
}
@end
