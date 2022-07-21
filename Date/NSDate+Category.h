//
//  NSDate+Category.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import <Foundation/Foundation.h>
#import "DateFormatHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Category)
/**
 时间转字符串
 
 @param format 转换时间格式
 */
- (NSString *)string:(DateFormatter)format;

/// 时间转毫秒级时间戳
@property (nonatomic, readonly) NSString *timeStamp;

#pragma mark - Component Properties
/// 年
@property (nonatomic, readonly) NSInteger year;
/// 月 1~12
@property (nonatomic, readonly) NSInteger month;
/// 日 1~31
@property (nonatomic, readonly) NSInteger day;
/// 时 0~23
@property (nonatomic, readonly) NSInteger hour;
/// 分 0~59
@property (nonatomic, readonly) NSInteger minute;
/// 秒 0~59
@property (nonatomic, readonly) NSInteger second;
/// 纳秒
@property (nonatomic, readonly) NSInteger nanosecond;
/// 一个月有几天
@property (nonatomic, readonly) NSInteger days;
/// 星期几 1~7
@property (nonatomic, readonly) NSInteger weekday;
/// 工作日的顺序
@property (nonatomic, readonly) NSInteger weekdayOrdinal;
/// 月中的第几周
@property (nonatomic, readonly) NSInteger weekOfMonth;
/// 年中的第几周 1~53
@property (nonatomic, readonly) NSInteger weekOfYear;
///< WeekOfYear component (1~53)
@property (nonatomic, readonly) NSInteger yearForWeekOfYear;
/// 季度
@property (nonatomic, readonly) NSInteger quarter;
/// 闰月
@property (nonatomic, readonly) BOOL isLeapMonth;
/// 闰年
@property (nonatomic, readonly) BOOL isLeapYear;
/// 今天
@property (nonatomic, readonly) BOOL isToday;
/// 昨天
@property (nonatomic, readonly) BOOL isYesterday;
/// 昨天开始
@property (nonatomic, readonly) NSDate *yesterdayStart;
/// 昨天结束
@property (nonatomic, readonly) NSDate *yesterdayEnd;
/// 当天开始
@property (nonatomic, readonly) NSDate *curDayStart;
/// 当天结束
@property (nonatomic, readonly) NSDate *curDayEnd;
/// 本周开始
@property (nonatomic, readonly) NSDate *curWeekStart;
/// 本周结束
@property (nonatomic, readonly) NSDate *curWeekEnd;
/// 当月开始
@property (nonatomic, readonly) NSDate *curMonthStart;
/// 当月结束
@property (nonatomic, readonly) NSDate *curMonthEnd;

#pragma mark - Date modify
/**
 时间前进几年
 
 @param years  年
 */
- (nullable NSDate *)dateByAddingYears:(NSInteger)years;

/**
 时间前进几月
 
 @param months  月
 */
- (nullable NSDate *)dateByAddingMonths:(NSInteger)months;

/**
 时间前进几周
 
 @param weeks  周
 */
- (nullable NSDate *)dateByAddingWeeks:(NSInteger)weeks;

/**
 时间前进几天
 
 @param days  天
 */
- (nullable NSDate *)dateByAddingDays:(NSInteger)days;

/**
 时间前进几小时
 
 @param hours  小时
 */
- (nullable NSDate *)dateByAddingHours:(NSInteger)hours;

/**
 时间前进几分钟
 
 @param minutes  分钟
 */
- (nullable NSDate *)dateByAddingMinutes:(NSInteger)minutes;

/**
 时间前进几秒
 
 @param seconds  秒
 */
- (nullable NSDate *)dateByAddingSeconds:(NSInteger)seconds;
@end

NS_ASSUME_NONNULL_END
