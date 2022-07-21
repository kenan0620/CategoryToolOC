//
//  NSString+TextSize.m
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import "NSString+TextSize.h"

@implementation NSString (TextSize)
+ (CGFloat)getTextHeight:(float)textWidth
                    Text:(NSString *)text
                    Font:(UIFont *)font{
    if (!text.length) {
        return 0;
    }
    float origin = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: font} context:nil].size.height;
    return ceilf(origin);
}

+ (CGFloat)getTextWidth:(float)textHeight
                   Text:(NSString *)text
                   Font:(UIFont *)font{
    if (!text.length) {
        return 0;
    }
    float origin = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, textHeight) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: font} context:nil].size.width;
    return ceilf(origin);
}

- (NSAttributedString *)getAttributedText:(CGFloat)lineSpacing
                                     Font:(UIFont *)font{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];        //设置行间距
    [paragraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
    [paragraphStyle setAlignment:NSTextAlignmentLeft];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [self length])];
    return attributedString;
}
@end
