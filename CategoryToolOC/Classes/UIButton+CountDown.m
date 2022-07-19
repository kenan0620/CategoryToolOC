//
//  UIButton+CountDown.m
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/19.
//

#import "UIButton+CountDown.h"
#import <objc/runtime.h>

@implementation UIButton (CountDown)
//MARK: -----------------------Timer Start-----------------------

- (void)startTime:(NSInteger)timeout CountDownFormat:(NSString*)format{
    [self cancelTimer];
    self.timeOut = timeout;
    self.xxtitle = self.titleLabel.text;
    NSDictionary *info = @{@"countDownFormat":format ?: @"%zd秒"};
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerMethod:) userInfo:info repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setTitle:[NSString stringWithFormat:format ?: @"%zd秒",timeout] forState:UIControlStateNormal];
        self.userInteractionEnabled = NO;
    });
}

//MARK: -----------------------Timer Running-----------------------

- (void)timerMethod:(NSTimer*)timer{
    NSDictionary *info = timer.userInfo;
    NSString *countDownFormat = info[@"countDownFormat"];
    if (self.timeOut <= 1){
        [self cancelTimer];
    }else{
        self.timeOut--;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setTitle:[NSString stringWithFormat:countDownFormat,self.timeOut] forState:UIControlStateNormal];
            self.userInteractionEnabled = NO;
        });
    }
}

//MARK: -----------------------Cancel Timer-----------------------

- (void)cancelTimer{
    if (self.timer == nil) return;
    [self.timer invalidate];
    self.timer = nil;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setTitle:self.xxtitle forState:UIControlStateNormal];
        self.userInteractionEnabled = YES;
        if (self.countDownStopBlcok) { self.countDownStopBlcok(); }
    });
}

#pragma mark - Runtime
- (NSTimer*)timer{
    return objc_getAssociatedObject(self, @selector(timer));
}

- (void)setTimer:(NSTimer*)timer{
    objc_setAssociatedObject(self, @selector(timer), timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//MARK: -----------------------Title-----------------------

- (NSString*)xxtitle{
    return objc_getAssociatedObject(self, @selector(xxtitle));
}

- (void)setXxtitle:(NSString*)xxtitle{
    objc_setAssociatedObject(self, @selector(xxtitle), xxtitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//MARK: -----------------------Event-----------------------

- (void(^)(void))countDownStopBlcok{
    return objc_getAssociatedObject(self, @selector(countDownStopBlcok));
}

- (void)setCountDownStopBlcok:(void (^)(void))countDownStopBlcok{
    objc_setAssociatedObject(self, @selector(countDownStopBlcok), countDownStopBlcok, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//MARK: -----------------------TimeOut-----------------------
- (NSInteger)timeOut{
    return [objc_getAssociatedObject(self, @selector(timeOut)) integerValue];
}

- (void)setTimeOut:(NSInteger)timeOut{
    objc_setAssociatedObject(self, @selector(timeOut), @(timeOut), OBJC_ASSOCIATION_ASSIGN);
}
@end
