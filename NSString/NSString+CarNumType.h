//
//  NSString+CarNumType.h
//  CategoryToolOC
//
//  Created by 柯南 on 2022/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CarNumType)
/**
 是新能源车
 */
- (BOOL)isNewEnergy;

/**
 是车牌(包含新能源)
 */
- (BOOL)isCarNum;

/**
 普通车牌(不包含新能源)
 */
- (BOOL)isNormalCarNum;
@end

NS_ASSUME_NONNULL_END
