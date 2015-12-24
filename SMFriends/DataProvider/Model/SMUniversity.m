//
//  SMUniversity.m
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import "SMUniversity.h"

#import "NSDictionary+SMHelper.h"

@implementation SMUniversity

NSString *const kUniversityNameKey       = @"name";
NSString *const kUniversityFacultyKey    = @"faculty_name";
NSString *const kUniversityGraduationKey = @"graduation";

+ (NSArray *)universitiesFromArray:(NSArray *)array {

    NSMutableArray *unis = [NSMutableArray new];

    for (NSDictionary *dict in array) {

        SMUniversity *uni = [[self alloc] _initWithDictionary:dict];

        if (uni) {
            [unis addObject:uni];
        }

    }

    return unis;
}

- (instancetype)_initWithDictionary:(NSDictionary *)dict {

    self = [super init];

    if (self) {
        [self fillFromDictionary:dict];
    }

    return self;
}

- (void)fillFromDictionary:(NSDictionary *)dict {

    _name = [dict stringForKey:kUniversityNameKey];
    _faculty = [dict stringForKey:kUniversityFacultyKey];
    _graduation = [dict integerForKey:kUniversityGraduationKey];

}

@end
