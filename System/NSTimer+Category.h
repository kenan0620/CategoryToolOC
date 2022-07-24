//
//  NSTimer+Category.h
//  CategoryToolOC
//
//  Created by zsn on 2022/7/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (Category)
/**
 计时器暂停
 */
- (void)pauseTimer;


/**
 计时器开始
 */
- (void)resumeTimer;


/**
 延迟开始计时器
 
 @param interval 延迟时间
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;
@end

NS_ASSUME_NONNULL_END
