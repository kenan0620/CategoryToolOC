//
//  NSAttributedString+TextSize.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (TextSize)
/**
 获取属性字符串的高度
 
 @param textWidth 文本宽度
 */
- (CGFloat)getTextHeight:(float)textWidth;

/**
 获取属性字符串的宽度
 
 @param textHeight 文本高度
 */
- (CGFloat)getTextWidth:(float)textHeight;
@end

NS_ASSUME_NONNULL_END
