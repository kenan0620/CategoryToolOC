//
//  UIViewController+Category.m
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)
- (void)hiddenSystemBackItem{
    [self.navigationController.navigationItem setHidesBackButton:YES];
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationController.navigationBar.backItem setHidesBackButton:YES];
}
@end
