//
//  UIButton+Category.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    Button_ImageTypeAtTop,
    Button_ImageTypeAtLeft,
    Button_ImageTypeAtBottom,
    Button_ImageTypeAtRight
} Button_ImageType;

@interface UIButton (Category)
/// 防暴力点击时间
@property(nonatomic,assign) CGFloat timeInterval;

/// 设置按钮额外热区
@property(nonatomic,assign) UIEdgeInsets touchAreaInsets;

/// 扩大点击域
- (void)enlargeEdgeWithTop:(CGFloat)top
                      Left:(CGFloat)left
                    Bottom:(CGFloat)bottom
                     Right:(CGFloat)right;

/**
 设置文字图片位置
 
 @param type 图片所处位置
 @param space 图片文字间隔
 */
- (void)setImageType:(Button_ImageType )type
               Space:(CGFloat )space;

/**
 设置文字图片位置
 
 @param type 图片所处位置
 @param space 图片文字间隔
 */
- (void)setImageType:(Button_ImageType )type
           ImageSize:(CGSize)size
               Space:(CGFloat )space;
@end

NS_ASSUME_NONNULL_END
