//
//  UIButton+CountDown.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (CountDown)
/// 倒计时结束的回调
@property(nonatomic,copy,readwrite)void(^countDownStopBlcok)(void);

/// 设置倒计时的间隔和倒计时文案，默认为 @"%zd秒"
- (void)startTime:(NSInteger)timeout CountDownFormat:(NSString*)format;

/// 取消倒计时
- (void)cancelTimer;
@end

NS_ASSUME_NONNULL_END
