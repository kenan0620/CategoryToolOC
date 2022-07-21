//
//  NSAttributedString+TextSize.m
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import "NSAttributedString+TextSize.h"

@implementation NSAttributedString (TextSize)
- (CGFloat)getTextHeight:(float)textWidth{
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textWidth, MAXFLOAT)];
    textLabel.attributedText = self;
    textLabel.numberOfLines = 0;
    [textLabel sizeToFit];
    
    return ceil(textLabel.frame.size.height);
}

- (CGFloat)getTextWidth:(float)textHeight{
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, MAXFLOAT, textHeight)];
    textLabel.attributedText = self;
    textLabel.numberOfLines = 0;
    [textLabel sizeToFit];
    
    return ceil(textLabel.frame.size.width);
}
@end
