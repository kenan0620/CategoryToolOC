//
//  NSTimer+Category.m
//  CategoryToolOC
//
//  Created by zsn on 2022/7/24.
//

#import "NSTimer+Category.h"

@implementation NSTimer (Category)
- (void)pauseTimer {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate distantFuture]];
}

- (void)resumeTimer {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval {
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}
@end
