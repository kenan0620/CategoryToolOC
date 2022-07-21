//
//  NSString+DateCategory.m
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import "NSString+DateCategory.h"
#import "NSDateFormatter+Category.h"

@implementation NSString (DateCategory)
- (NSString *)date:(DateFormatter)format{
    NSTimeInterval time = [self doubleValue]/1000;
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:time];
    
    return [[NSDateFormatter getFormatter:format] stringFromDate: date];
}
@end
