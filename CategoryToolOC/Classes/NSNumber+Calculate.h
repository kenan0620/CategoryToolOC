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
- (NSString *)adding:(NSNumber *)number;

/**
 加法计算，默认保留两位小数
 
 @param number 被加数
 @param mode 四舍五入的方式
 
 @return 加后结果
 */
- (NSString *)adding:(NSNumber *)number
        RoundingMode:(NSRoundingMode)mode;
/**
 加法计算
 
 @param number 被加数
 @param mode 四舍五入的方式
 @param scale 保留小数位数
 
 @return 加后结果
 */
- (NSString *)adding:(NSNumber *)number
        RoundingMode:(NSRoundingMode)mode
               Scale:(NSInteger)scale;

/**
 减法计算，默认保留两位小数，默认采用四舍五入的方式处理计算结果,
 
 @param number 被减数
 
 @return 减后结果
 */
- (NSString *)subtracting:(NSNumber *)number;

/**
 减法计算，默认保留两位小数
 
 @param number 被减数
 @param mode 四舍五入的方式
 
 @return 减后结果
 */
- (NSString *)subtracting:(NSNumber *)number
             RoundingMode:(NSRoundingMode)mode;
/**
 减法计算
 
 @param number 被减数
 @param mode 四舍五入的方式
 @param scale 保留小数位数
 
 @return 减后结果
 */
- (NSString *)subtracting:(NSNumber *)number
             RoundingMode:(NSRoundingMode)mode
                    Scale:(NSInteger)scale;

/**
 乘法计算，默认保留两位小数，默认采用四舍五入的方式处理计算结果,
 
 @param number 被乘数
 
 @return 乘后结果
 */
- (NSString *)multiplying:(NSNumber *)number;

/**
 乘法计算，默认保留两位小数
 
 @param number 被乘数
 @param mode 四舍五入的方式
 
 @return 乘后结果
 */
- (NSString *)multiplying:(NSNumber *)number
             RoundingMode:(NSRoundingMode)mode;
/**
 乘法计算
 
 @param number 被乘数
 @param mode 四舍五入的方式
 @param scale 保留小数位数
 
 @return 乘后结果
 */
- (NSString *)multiplying:(NSNumber *)number
             RoundingMode:(NSRoundingMode)mode
                    Scale:(NSInteger)scale;

/**
 除法计算，默认保留两位小数，默认采用四舍五入的方式处理计算结果,
 
 @param number 被除数
 
 @return 除后结果
 */
- (NSString *)dividing:(NSNumber *)number;

/**
 除法计算，默认保留两位小数
 
 @param number 被除数
 @param mode 四舍五入的方式
 
 @return 除后结果
 */
- (NSString *)dividing:(NSNumber *)number
          RoundingMode:(NSRoundingMode)mode;
/**
 除法计算
 
 @param number 被除数
 @param mode 四舍五入的方式
 @param scale 保留小数位数
 
 @return 除后结果
 */
- (NSString *)dividing:(NSNumber *)number
          RoundingMode:(NSRoundingMode)mode
                 Scale:(NSInteger)scale;
@end

NS_ASSUME_NONNULL_END
