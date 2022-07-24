//
//  UIWindow+Category.m
//  CategoryToolOC
//
//  Created by zsn on 2022/7/24.
//

#import "UIWindow+Category.h"

@implementation UIWindow (Category)
- (__kindof UIView *)findFirstResponder{
    return [self findFirstResponderInView:self];
}

- (__kindof UIView *)findFirstResponderInView:(UIView *)topView{
    if ([topView isFirstResponder]) {
        return topView;
    }

    for (UIView *subView in topView.subviews) {
        if ([subView isFirstResponder]) {
            return subView;
        }

        UIView *firstResponderCheck = [self findFirstResponderInView:subView];
        if (nil != firstResponderCheck) {
            return firstResponderCheck;
        }
    }
    return nil;
}
@end
