//
//  NSString+TextSize.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TextSize)
/**
 获取文字的高度
 
 @param textWidth 文本宽度
 @param text 文本
 @param font 字体
 */
+ (CGFloat)getTextHeight:(float)textWidth
                    Text:(NSString *)text
                    Font:(UIFont *)font;
/**
 获取文字的宽度
 
 @param textHeight 文本高度
 @param text 文本
 @param font 字体
 */
+ (CGFloat)getTextWidth:(float)textHeight
                   Text:(NSString *)text
                   Font:(UIFont *)font;
/**
 获取有间隔的属性字符串
 
 @param lineSpacing 字符串间距
 @param font 字体
 */
- (NSAttributedString *)getAttributedText:(CGFloat)lineSpacing
                                     Font:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
