//
//  UIDevice+Category.h
//  CategoryToolOC
//
//  Created by zsn on 2022/7/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Category)
/// 系统版本
+ (double)systemVersion;

/**
 获取唯一设备号
 
 @param key  关键字
 */
+ (NSString *)uniqueUUIDWithKey:(NSString *)key;

/// 刘海屏
@property (nonatomic, readonly) BOOL isBangScreen;

/// iPad
@property (nonatomic, readonly) BOOL isPad;

/// 模拟器
@property (nonatomic, readonly) BOOL isSimulator;

/// 打电话
@property (nonatomic, readonly) BOOL canMakePhoneCalls NS_EXTENSION_UNAVAILABLE_IOS("");

/// 系统启动时间
@property (nonatomic, readonly) NSDate *systemUptime;

#pragma mark - WiFi Information


/// 设备WIFI 内网IP 地址  e.g. @"192.168.1.111"
//@property (nullable, nonatomic, readonly) NSString *ipAddressWIFI;
//
///// 设备 外网IP 地址. e.g. @"10.2.2.222"
//@property (nullable, nonatomic, readonly) NSString *ipAddressCell;

#pragma mark - Disk Space (字节)(-1 错误)
/// 总磁盘空间
@property (nonatomic, readonly) int64_t diskSpace;

/// 剩余磁盘空间
@property (nonatomic, readonly) int64_t diskSpaceFree;

/// 使用磁盘空间
@property (nonatomic, readonly) int64_t diskSpaceUsed;

#pragma mark - Memory Information (字节)(-1 错误)

/// 总物理内存
@property (nonatomic, readonly) int64_t memoryTotal;

/// 已使用物理内存
@property (nonatomic, readonly) int64_t memoryUsed;

/// 剩余物理内存
@property (nonatomic, readonly) int64_t memoryFree;

/// 活动物理内存
@property (nonatomic, readonly) int64_t memoryActive;

/// 非活动物理内存
@property (nonatomic, readonly) int64_t memoryInactive;

/// 内存交换
@property (nonatomic, readonly) int64_t memoryWired;

/// 便携内存
@property (nonatomic, readonly) int64_t memoryPurgable;


#pragma mark - CPU Information

/// 几核CPU处理器
@property (nonatomic, readonly) NSUInteger cpuCount;

/// 当前CPU使用率
@property (nonatomic, readonly) float cpuUsage;

/// 当前每个处理器的CPU使用率
@property (nullable, nonatomic, readonly) NSArray<NSNumber *> *cpuUsagePerProcessor;
@end

NS_ASSUME_NONNULL_END
