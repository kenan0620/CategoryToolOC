//
//  NSNumber+Calculate.h
//  CategoryToolOC
//
//  Created by 柯南 on 2023/2/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (Calculate)
/**
 NSNumber比较
 
 @param number 待比较Number
 
 @return 比较结果 小于、等于、大于
 */
- (NSComparisonResult)numberCompare:(NSNumber *)number;

/**
 加法计算，默认保留两位小数，默认采用四舍五入的方式处理计算结果,
 
 @param number 被加数
 
 @return 加后结果
 */
- (NSNumber *)adding:(NSNumber *)number;

/**
 减法计算，默认保留两位小数，默认采用四舍五入的方式处理计算结果,
 
 @param number 被减数
 
 @return 减后结果
 */
- (NSNumber *)subtracting:(NSNumber *)number;

/**
 乘法计算，默认保留两位小数，默认采用四舍五入的方式处理计算结果,
 
 @param number 被乘数
 
 @return 乘后结果
 */
- (NSNumber *)multiplying:(NSNumber *)number;

/**
 除法计算，默认保留两位小数，默认采用四舍五入的方式处理计算结果,
 
 @param number 被除数
 
 @return 除后结果
 */
- (NSNumber *)dividing:(NSNumber *)number;

/**
 小数位展示使用，带逗号
 
 @param digit 小数位数, 默认四舍五入
 */
- (NSString *)decimalDigit:(int)digit;

/**
 小数位展示使用，不带逗号
 
 @param digit 小数位数, 默认四舍五入
 */
- (NSString *)decimalDigitParam:(int)digit;
@end

NS_ASSUME_NONNULL_END
