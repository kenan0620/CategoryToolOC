//
//  UIButton+Category.m
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/19.
//

#import "UIButton+Category.h"
#import <objc/runtime.h>

static const char Btn_ImageViewStyle_key;
static const char Btn_ImageSize_key;
static const char Btn_ImageSpace_key;
static const char TopNameKey;
static const char LeftNameKey;
static const char BottomNameKey;
static const char RightNameKey;

@implementation UIButton (Category)
//MARK: -----------------------防暴力点击-----------------------

- (CGFloat)timeInterval{
    return [objc_getAssociatedObject(self, @selector(timeInterval)) doubleValue];
}

- (void)setTimeInterval:(CGFloat)timeInterval{
    objc_setAssociatedObject(self, @selector(timeInterval), @(timeInterval), OBJC_ASSOCIATION_ASSIGN);
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kExceptionMethodSwizzling([self class], @selector(sendAction:to:forEvent:), @selector(ltm_sendAction:to:forEvent:));
    });
}

- (void)ltm_sendAction:(SEL)action to:(id)target forEvent:(UIEvent*)event{
    if (self.timeInterval <= 0) {
        [self ltm_sendAction:action to:target forEvent:event];
        return;
    }
    NSTimeInterval time = CFAbsoluteTimeGetCurrent();
    if ((time - self.lastTime >= self.timeInterval)) {
        self.lastTime = time;
        [self ltm_sendAction:action to:target forEvent:event];
    }
}

- (NSTimeInterval)lastTime{
    return [objc_getAssociatedObject(self, @selector(lastTime)) doubleValue];
}
- (void)setLastTime:(NSTimeInterval)lastTime{
    objc_setAssociatedObject(self, @selector(lastTime), @(lastTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//MARK: -----------------------设置热区-----------------------

static void kExceptionMethodSwizzling(Class clazz, SEL original, SEL swizzled){
    Method originalMethod = class_getInstanceMethod(clazz, original);
    Method swizzledMethod = class_getInstanceMethod(clazz, swizzled);
    if (class_addMethod(clazz, original, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(clazz, swizzled, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)enlargeEdgeWithTop:(CGFloat)top
                      Left:(CGFloat)left
                    Bottom:(CGFloat)bottom
                     Right:(CGFloat)right{
    objc_setAssociatedObject(self, &TopNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &LeftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &BottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &RightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect{
    NSNumber *topEdge   = objc_getAssociatedObject(self, &TopNameKey);
    NSNumber *leftEdge  = objc_getAssociatedObject(self, &LeftNameKey);
    NSNumber *bottomEdge= objc_getAssociatedObject(self, &BottomNameKey);
    NSNumber *rightEdge = objc_getAssociatedObject(self, &RightNameKey);
    
    if (topEdge && rightEdge && bottomEdge && leftEdge){
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue, self.bounds.origin.y - topEdge.floatValue, self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue, self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }else {
        return self.bounds;
    }
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event{
    UIEdgeInsets touchAreaInsets = self.touchAreaInsets;
    CGRect bounds = self.bounds;
    bounds = CGRectMake(bounds.origin.x - touchAreaInsets.left, bounds.origin.y - touchAreaInsets.top, bounds.size.width + touchAreaInsets.left + touchAreaInsets.right, bounds.size.height + touchAreaInsets.top + touchAreaInsets.bottom);
    return CGRectContainsPoint(bounds, point);
}

- (UIEdgeInsets)touchAreaInsets{
    return [objc_getAssociatedObject(self, @selector(touchAreaInsets)) UIEdgeInsetsValue];
}

- (void)setTouchAreaInsets:(UIEdgeInsets)touchAreaInsets{
    NSValue *value = [NSValue valueWithUIEdgeInsets:touchAreaInsets];
    objc_setAssociatedObject(self, @selector(touchAreaInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//MARK: -----------------------设置图片位置-----------------------

- (void)setImageType:(Button_ImageType )type
               Space:(CGFloat )space{
    [self setImageType:type ImageSize:self.currentImage.size Space:space];
}

- (void)setImageType:(Button_ImageType )type
           ImageSize:(CGSize)size
               Space:(CGFloat )space{
    objc_setAssociatedObject(self, &Btn_ImageViewStyle_key, @(type), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &Btn_ImageSize_key, NSStringFromCGSize(size), OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &Btn_ImageSpace_key, @(space), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load{
    Method oldMethod = class_getInstanceMethod([self class], @selector(layoutSubviews));
    Method newMethod = class_getInstanceMethod([self class], @selector(layoutSubviews1));
    method_exchangeImplementations(oldMethod, newMethod);
}

- (void)layoutSubviews1{
    [self layoutSubviews1];
    NSNumber *typeNum = objc_getAssociatedObject(self, &Btn_ImageViewStyle_key);
    if (typeNum != nil) {
        NSNumber *spaceNum = objc_getAssociatedObject(self, &Btn_ImageSpace_key);
        NSString *imageSizeStr = objc_getAssociatedObject(self, &Btn_ImageSize_key);
        CGSize imageSize = self.currentImage ? CGSizeFromString(imageSizeStr) : CGSizeZero;
        CGSize labelSize = self.currentTitle.length ? [self.currentTitle sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}] : CGSizeZero;
        CGFloat space = (labelSize.width && self.currentImage) ? spaceNum.floatValue : 0;
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        CGFloat imgX = 0.0;
        CGFloat imgY = 0.0;
        CGFloat labelX = 0.0;
        CGFloat labelY = 0.0;
        switch (typeNum.integerValue) {
            case Button_ImageTypeAtTop:
            {
                imgX = (width - imageSize.width) / 2.0;
                imgY = (height - imageSize.height - labelSize.height - space) / 2.0;
                labelX = (width - labelSize.width) / 2.0;
                labelY = imgY + imageSize.height + space;
                self.imageView.contentMode = UIViewContentModeBottom;
            }
                break;
            case Button_ImageTypeAtLeft:
            {
                imgX = (width - imageSize.width - labelSize.width - space) / 2.0;
                imgY = (height - imageSize.height) / 2.0;
                labelX = imgX + imageSize.width + space;
                labelY = (height - labelSize.height) / 2.0;
                self.imageView.contentMode = UIViewContentModeRight;
            }
                break;
            case Button_ImageTypeAtBottom:
            {
                labelX = (width - labelSize.width) / 2.0;
                labelY = (height - labelSize.height - imageSize.height - space) / 2.0;
                imgX = (width - imageSize.width) / 2.0;
                imgY = labelY + labelSize.height + space;
                self.imageView.contentMode = UIViewContentModeTop;
            }
                break;
            case Button_ImageTypeAtRight:
            {
                labelX = (width - imageSize.width - labelSize.width - space) / 2.0;
                labelY = (height - labelSize.height) / 2.0;
                imgX = labelX + labelSize.width + space;
                imgY = (height - imageSize.height) / 2.0;
                self.imageView.contentMode = UIViewContentModeLeft;
            }
                break;
        }
        self.imageView.frame = CGRectMake(imgX, imgY, imageSize.width, imageSize.height);
        self.titleLabel.frame = CGRectMake(labelX, labelY, labelSize.width, labelSize.height);
    }
}
@end
