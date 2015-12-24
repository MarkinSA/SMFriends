//
//  NSDictionary+SMHelper.m
//  t1
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import "NSDictionary+SMHelper.h"

@implementation NSDictionary (SMHelper)

- (NSString *)stringForKey:(NSString *)key {

    NSString *stringForKey;

    id probablyString = [self objectForKey:key];

    if ([probablyString isKindOfClass:[NSString class]]) {
        stringForKey = (NSString *)probablyString;
    }

    return stringForKey;
}

- (NSInteger)integerForKey:(NSString *)key {

    NSInteger integerForKey;

    id probablyNumber = [self objectForKey:key];

    if ([probablyNumber isKindOfClass:[NSNumber class]]) {
        integerForKey = [probablyNumber integerValue];
    }

    return integerForKey;
}

- (BOOL)booleanForKey:(NSString *)key {

    BOOL boolForKey;

    id probablyNumber = [self objectForKey:key];

    if ([probablyNumber isKindOfClass:[NSNumber class]]) {
        boolForKey = [probablyNumber boolValue];
    }

    return boolForKey;
}

- (NSArray *)arrayForKey:(NSString *)key {

    NSArray *arrayForKey;

    id probablyArray = [self objectForKey:key];

    if ([probablyArray isKindOfClass:[NSArray class]]) {
        arrayForKey = probablyArray;
    }

    return arrayForKey;
}

- (NSDictionary *)dictionaryForKey:(NSString *)key {

    NSDictionary *dictionaryForKey;

    id probablyDictionary = [self objectForKey:key];

    if ([probablyDictionary isKindOfClass:[NSDictionary class]]) {
        dictionaryForKey = probablyDictionary;
    }

    return dictionaryForKey;
}

@end
