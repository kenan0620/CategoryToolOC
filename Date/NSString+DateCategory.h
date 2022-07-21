//
//  NSString+DateCategory.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import <Foundation/Foundation.h>
#import "DateFormatHeader.h"
NS_ASSUME_NONNULL_BEGIN

@interface NSString (DateCategory)
/**
 时间戳转时间
 
 @param format 转换时间格式
 */
- (NSString *)date:(DateFormatter)format;

@end

NS_ASSUME_NONNULL_END
