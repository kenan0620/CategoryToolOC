//
//  UIScrollView+Category.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (Category)
/**
 滚动到顶部
 */
- (void)scrollToTop;

/**
 滚动到底部
 */
- (void)scrollToBottom;

/**
 滚动到左边
 */
- (void)scrollToLeft;

/**
 滚动到右边
 */
- (void)scrollToRight;

/**
 滚动到底部
 
 @param animated 动画
 */
- (void)scrollToTopAnimated:(BOOL)animated;

/**
 滚动到顶部
 
 @param animated 动画
 */
- (void)scrollToBottomAnimated:(BOOL)animated;

/**
 滚动到左边
 
 @param animated 动画
 */
- (void)scrollToLeftAnimated:(BOOL)animated;

/**
 滚动到右边
 
 @param animated 动画
 */
- (void)scrollToRightAnimated:(BOOL)animated;
@end

NS_ASSUME_NONNULL_END
