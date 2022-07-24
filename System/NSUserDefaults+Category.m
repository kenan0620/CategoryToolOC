//
//  NSUserDefaults+Category.m
//  CategoryToolOC
//
//  Created by zsn on 2022/7/24.
//

#import "NSUserDefaults+Category.h"

@implementation NSUserDefaults (Category)
- (void)setValue:(id)value forKey:(NSString *)key iCloudSync:(BOOL)sync {
    if (sync){
        [[NSUbiquitousKeyValueStore defaultStore] setValue:value forKey:key];
    }

    [self setValue:value forKey:key];
}

- (id)valueForKey:(NSString *)key iCloudSync:(BOOL)sync {
    if (sync) {
        //Get value from iCloud
        id value = [[NSUbiquitousKeyValueStore defaultStore] valueForKey:key];

        //Store locally and synchronize
        [self setValue:value forKey:key];
        [self synchronize];

        return value;
    }

    return [self valueForKey:key];
}

- (void)removeValueForKey:(NSString *)key iCloudSync:(BOOL)sync {
    [self removeObjectForKey:key iCloudSync:sync];
}

- (void)setObject:(id)value forKey:(NSString *)key iCloudSync:(BOOL)sync {
    if (sync){
        [[NSUbiquitousKeyValueStore defaultStore] setObject:value forKey:key];
    }

    [self setObject:value forKey:key];
}

- (id)objectForKey:(NSString *)key iCloudSync:(BOOL)sync {
    if (sync) {
        //Get value from iCloud
        id value = [[NSUbiquitousKeyValueStore defaultStore] objectForKey:key];

        //Store to NSUserDefault and synchronize
        [self setObject:value forKey:key];
        [self synchronize];

        return value;
    }

    return [self objectForKey:key];
}

- (void)removeObjectForKey:(NSString *)key iCloudSync:(BOOL)sync {
    if (sync){
        [[NSUbiquitousKeyValueStore defaultStore] removeObjectForKey:key];
    }

    //Remove from NSUserDefault
    return [self removeObjectForKey:key];
}

- (BOOL)synchronizeAlsoiCloudSync:(BOOL)sync {
    BOOL res = true;

    if (sync){
        res &= [self synchronize];
    }

    res &= [[NSUbiquitousKeyValueStore defaultStore] synchronize];

    return res;
}

+ (NSString *)stringForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] stringForKey:key];
}

+ (NSArray *)arrayForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] arrayForKey:key];
}

+ (NSDictionary *)dictionaryForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] dictionaryForKey:key];
}

+ (NSData *)dataForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] dataForKey:key];
}

+ (NSArray *)stringArrayForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] stringArrayForKey:key];
}

+ (NSInteger)integerForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] integerForKey:key];
}

+ (float)floatForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] floatForKey:key];
}

+ (double)doubleForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] doubleForKey:key];
}

+ (BOOL)boolForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] boolForKey:key];
}

+ (NSURL *)URLForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] URLForKey:key];
}

#pragma mark--- WRITE FOR STANDARD

+ (void)setObject:(id)value forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark--- READ ARCHIVE FOR STANDARD

+ (id)archiverObjectForKey:(NSString *)key {
    return [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:key]];
}

#pragma mark--- WRITE ARCHIVE FOR STANDARD

+ (void)setArchiverObject:(id)value forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:value] forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
