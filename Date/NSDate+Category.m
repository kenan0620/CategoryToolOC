//
//  NSDate+Category.m
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import "NSDate+Category.h"
#import "NSDateFormatter+Category.h"

@implementation NSDate (Category)
- (NSString *)string:(DateFormatter)format{
    
    return [[NSDateFormatter getFormatter:format] stringFromDate:self];
}

- (NSString *)timeStamp{
    NSTimeInterval time = [self timeIntervalSince1970]*1000;
    
    return [NSString stringWithFormat:@"%.0f", time];
}

- (NSInteger)year {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)month {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)day {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)hour {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)minute {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)second {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)nanosecond {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] nanosecond];
}

- (NSInteger)days{
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
}

- (NSInteger)weekday {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
}

- (NSInteger)weekdayOrdinal {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekdayOrdinal fromDate:self] weekdayOrdinal];
}

- (NSInteger)weekOfMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfMonth fromDate:self] weekOfMonth];
}

- (NSInteger)weekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate:self] weekOfYear];
}

- (NSInteger)yearForWeekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYearForWeekOfYear fromDate:self] yearForWeekOfYear];
}

- (NSInteger)quarter {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] quarter];
}

- (BOOL)isLeapMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] isLeapMonth];
}

- (BOOL)isLeapYear {
    NSUInteger year = self.year;
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

- (BOOL)isToday {
    if (fabs(self.timeIntervalSinceNow) >= 60 * 60 * 24) return NO;
    return [NSDate new].day == self.day;
}

- (BOOL)isYesterday {
    NSDate *added = [self dateByAddingDays:1];
    return [added isToday];
}

- (NSDate *)yesterdayStart{
    return [[self curDayStart] dateByAddingDays:-1];
}

- (NSDate *)yesterdayEnd{
    return [[self curDayEnd] dateByAddingDays:-1];
}

- (NSDate *)curDayStart{
    NSCalendar *calendar         = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:self.year];
    [components setMonth:self.month];
    [components setDay:self.day];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)curDayEnd{
    NSCalendar *calendar         = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:self.year];
    [components setMonth:self.month];
    [components setDay:self.day];
    [self setLastDay:components];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)curWeekStart{
    NSCalendar *calendar= [NSCalendar currentCalendar];
    /// 设置一周的第一天是星期一
    calendar.firstWeekday = 2;
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:self.year];
    [components setMonth:self.month];
    NSInteger countDays = 0;
    if (calendar.firstWeekday > self.weekday) {
        countDays = 7 + (self.weekday - calendar.firstWeekday);
    } else {
        countDays = self.weekday - calendar.firstWeekday;
    }
    [components setDay:self.day - countDays];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)curWeekEnd{
    NSCalendar *calendar= [NSCalendar currentCalendar];
    /// 设置一周的第一天是星期一
    calendar.firstWeekday = 2;
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:self.year];
    [components setMonth:self.month];
    NSInteger countDays = 0;
    if (calendar.firstWeekday > self.weekday) {
        countDays = 7 + (self.weekday - calendar.firstWeekday);
    } else {
        countDays = self.weekday - calendar.firstWeekday;
    }
    [components setDay:self.day - countDays + 6];
    [self setLastDay:components];
    NSDate *curD = [calendar dateFromComponents:components];
    
    return curD;
}

- (NSDate *)curMonthStart{
    NSCalendar *calendar         = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:self.year];
    [components setMonth:self.month];
    [components setDay:1];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)curMonthEnd{
    NSCalendar *calendar         = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:self.year];
    [components setMonth:self.month];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    [components setDay:range.length];
    [self setLastDay:components];
    
    return [calendar dateFromComponents:components];
}

/// 设置一天最后时间
- (NSDateComponents *)setLastDay:(NSDateComponents *)sender{
    [sender setHour:23];
    [sender setMinute:59];
    [sender setSecond:59];
    return sender;
}

- (NSDate *)dateByAddingYears:(NSInteger)years {
    NSCalendar *calendar         = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:years];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingMonths:(NSInteger)months {
    NSCalendar *calendar         = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:months];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingWeeks:(NSInteger)weeks {
    NSCalendar *calendar         = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setWeekOfYear:weeks];
    return [calendar dateByAddingComponents:components toDate:self options:0];
}

- (NSDate *)dateByAddingDays:(NSInteger)days {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 86400 * days;
    NSDate *newDate              = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingHours:(NSInteger)hours {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 3600 * hours;
    NSDate *newDate              = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingMinutes:(NSInteger)minutes {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 60 * minutes;
    NSDate *newDate              = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)dateByAddingSeconds:(NSInteger)seconds {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + seconds;
    NSDate *newDate              = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}
@end
