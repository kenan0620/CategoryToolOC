//
//  NSString+Decimal.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//  字符串 - 金额(钱)处理

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Decimal)
/**
 金额数字千位逗号分隔格式化
 例： 1234.1234 --> 1,234.1234
 */
- (NSString *)formatDecimal;

/**
 去除展示逗号
 */
- (NSString*)noComma;
@end

NS_ASSUME_NONNULL_END
