//
//  UIApplication+Category.h
//  CategoryToolOC
//
//  Created by zsn on 2022/7/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (Category)
/// NSDocumentDirectory目录
@property (nonatomic, readonly) NSURL *documentsURL;
/// NSDocumentDirectory路径
@property (nonatomic, readonly) NSString *documentsPath;
/// NSCachesDirectory目录
@property (nonatomic, readonly) NSURL *cachesURL;
/// NSCachesDirectory路径
@property (nonatomic, readonly) NSString *cachesPath;
/// NSLibraryDirectory目录
@property (nonatomic, readonly) NSURL *libraryURL;
/// NSLibraryDirectory路径
@property (nonatomic, readonly) NSString *libraryPath;
/// app名称
@property (nullable, nonatomic, readonly) NSString *appBundleName;
/// app ID
@property (nullable, nonatomic, readonly) NSString *appBundleID;
/// app 版本
@property (nullable, nonatomic, readonly) NSString *appVersion;
/// app 构建版本
@property (nullable, nonatomic, readonly) NSString *appBuildVersion;
/// 是否开发者模式
@property (nonatomic, readonly) BOOL isBeingDebugged;
/// 内存使用
@property (nonatomic, readonly) int64_t memoryUsage;
/// cpu使用率
@property (nonatomic, readonly) float cpuUsage;
/// Test Flight 版本
@property (nonatomic, assign, readonly, getter=isRunningTestFlightBeta) BOOL runningTestFlightBeta;
@end

NS_ASSUME_NONNULL_END
