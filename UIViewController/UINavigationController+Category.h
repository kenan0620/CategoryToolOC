//
//  UINavigationController+Category.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (Category)
/**
 Pop 到目标VC
 
 @param cls 目标VC
 @param animated 动画
 */
- (NSArray *)popToTargetVC:(Class)cls
                  Animated:(BOOL)animated;
/**
 Pop后 Push到目标VC
 
 @param vc 目标VC
 @param animated 动画
 */
- (UIViewController *)popThenPushVC:(UIViewController *)vc
                           Animated:(BOOL)animated;
@end

NS_ASSUME_NONNULL_END
