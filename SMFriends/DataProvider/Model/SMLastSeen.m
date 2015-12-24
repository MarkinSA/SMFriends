//
//  SMLastSeen.m
//  t1
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import "SMLastSeen.h"

#import "NSDictionary+SMHelper.h"

@implementation SMLastSeen

NSString *const kLastSeenTimeKey     = @"time";
NSString *const kLastSeenPlatformKey = @"platform";

+ (instancetype)lastSeenFromDictionary:(NSDictionary *)dict {

    SMLastSeen *lastSeen = nil;

    if (dict != nil && dict.allKeys > 0) {
        lastSeen = [[self alloc] _initWithDictionary:dict];
    }

    return lastSeen;
}

- (instancetype)_initWithDictionary:(NSDictionary *)dict {

    self = [super init];

    if (self) {
        [self fillFromDictionary:dict];
    }

    return self;
}

- (void)fillFromDictionary:(NSDictionary *)dict {

    //
    NSInteger timestamp = [dict integerForKey:kLastSeenTimeKey];
    _date = [NSDate dateWithTimeIntervalSince1970:timestamp];

    //
    _platform  = [dict integerForKey:kLastSeenPlatformKey];
}

@end
