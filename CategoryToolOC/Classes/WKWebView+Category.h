//
//  WKWebView+Category.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/19.
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKWebView (Category)
+ (void)clearAllWebCache;

/**
 网页截长图
 */
- (void)screenshotsImage:(void(^)(UIImage *_Nullable image))handler;
@end

NS_ASSUME_NONNULL_END
