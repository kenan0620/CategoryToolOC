//
//  NSString+Decimal.m
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import "NSString+Decimal.h"

@implementation NSString (Decimal)
- (NSString *)formatDecimal{
    if (![self isPureFloat]) {
        return self;
    }
    if ([self containsString:@","]) {
        return self;
    }
    
    NSString *intValue = self;
    NSString *decimalValue = nil;
    if ([self containsString:@"."]) {
        intValue = [self componentsSeparatedByString:@"."].firstObject;
        decimalValue = [self componentsSeparatedByString:@"."].lastObject;
    }
    if (!intValue) {
        return self;
    }
    NSString *symbol = @"";
    if ([intValue hasPrefix:@"+"]) {
        symbol = @"+";
    } else if ([intValue hasPrefix:@"-"]) {
        symbol = @"-";
    } else if ([intValue hasPrefix:@"–"]) {
        symbol = @"–";
    }
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    NSString *result = [numberFormatter stringFromNumber:@(llabs(intValue.longLongValue))];
    if (decimalValue) {
        result = [NSString stringWithFormat:@"%@%@.%@", symbol, result, decimalValue];
    } else {
        result = [NSString stringWithFormat:@"%@%@", symbol, result];
    }
    return result;
}

- (NSString*)noComma{
    return [self stringByReplacingOccurrencesOfString:@"," withString:@""];
}

/// 判断是否为浮点型
- (BOOL)isPureFloat {
    NSScanner *scan = [NSScanner scannerWithString:self];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}
@end
