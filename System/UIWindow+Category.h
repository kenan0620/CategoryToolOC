//
//  UIWindow+Category.h
//  CategoryToolOC
//
//  Created by zsn on 2022/7/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (Category)
/**
 查找第一响应
 */
- (__kindof UIView *)findFirstResponder;

/**
 在视图中查找第一响应
 */
- (__kindof UIView *)findFirstResponderInView:(UIView *)topView;
@end

NS_ASSUME_NONNULL_END
