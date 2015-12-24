//
//  SMCity.m
//  t1
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import "SMCity.h"
#import "NSDictionary+SMHelper.h"

@implementation SMCity

NSString *const kCityIDKey    = @"cid";
NSString *const kCityNameKey = @"name";

+ (instancetype)cityFromDictionary:(NSDictionary *)dict {

    SMCity *city = nil;

    if (dict != nil && dict.allKeys > 0) {
        city = [[self alloc] _initWithDictionary:dict];
    }

    return city;
}

- (instancetype)_initWithDictionary:(NSDictionary *)dict {

    self = [super init];

    if (self) {
        [self fillFromDictionary:dict];
    }

    return self;
}

- (void)fillFromDictionary:(NSDictionary *)dict {

    _cityID = [dict integerForKey:kCityIDKey];
    _name = [dict stringForKey:kCityNameKey];
}

@end
