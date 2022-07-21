//
//  NSDateFormatter+Category.m
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import "NSDateFormatter+Category.h"

@implementation NSDateFormatter (Category)
+ (NSDateFormatter *)getFormatter:(DateFormatter)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    switch (format) {
            
        case DateFormatter_YMDHMS:
            formatter.dateFormat = @"yy年MM月dd日 HH:mm:ss";
            break;
        case DateFormatter_YMDHM:
            formatter.dateFormat = @"yy年MM月dd日 HH:mm";
            break;
        case DateFormatter_YMDH:
            formatter.dateFormat = @"yy年MM月dd日 HH";
            break;
        case DateFormatter_YMD:
            formatter.dateFormat = @"yy年MM月dd日";
            break;
        case DateFormatter_YMDHMS1:
            formatter.dateFormat = @"yy/MM/dd HH:mm:ss";
            break;
        case DateFormatter_YMDHM1:
            formatter.dateFormat = @"yy/MM/dd HH:mm";
            break;
        case DateFormatter_YMDH1:
            formatter.dateFormat = @"yy/MM/dd HH";
            break;
        case DateFormatter_YMD1:
            formatter.dateFormat = @"yy/MM/dd";
            break;
        case DateFormatter_YMDHMS2:
            formatter.dateFormat = @"yy-MM-dd HH:mm:ss";
            break;
        case DateFormatter_YMDHM2:
            formatter.dateFormat = @"yy-MM-dd HH:mm";
            break;
        case DateFormatter_YMDH2:
            formatter.dateFormat = @"yy-MM-dd HH";
            break;
        case DateFormatter_YMD2:
            formatter.dateFormat = @"yy-MM-dd";
            break;
    }
    return  formatter;
}
@end
