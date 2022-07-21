//
//  NSString+TextFiled.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TextFiled)
/**
 获取字符串长度
 */
- (NSInteger)getStringLenthOfBytes;
/**
 获取子段字符串长度
 
 @param index 索引位置
 */
- (NSString *)subBytesOfstringToIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
