//
//  UINavigationController+Category.m
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import "UINavigationController+Category.h"

@implementation UINavigationController (Category)
- (UIViewController *)vcForClass:(Class)cls {
    for (UIViewController *each in self.viewControllers) {
        if ([each isKindOfClass:cls] == YES) {
            return each;
        }
    }
    
    return nil;
}

- (NSArray *)popToTargetVC:(Class)cls Animated:(BOOL)animated{
    UIViewController *controller = [self vcForClass:cls];
    if (!controller) {
        return nil;
    }
    
    return [self popToViewController:controller animated:animated];
}

- (UIViewController *)popThenPushVC:(UIViewController *)vc
                           Animated:(BOOL)animated{
    UIViewController *controller = [self popViewControllerAnimated:NO];
    
    [self pushViewController:vc animated:animated];
    
    return controller;
}
@end
