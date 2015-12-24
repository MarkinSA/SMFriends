//
//  SMUser.m
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import "SMUser.h"

#import "NSDictionary+SMHelper.h"
#import "SMUniversity.h"

@interface SMUser ()

// секретные проперти, которые не видно снаружи
@property (nonatomic) BOOL hidden;
@property (nonatomic) BOOL deactivated;

@end

@implementation SMUser

//
NSString *const kUserHiddenKey = @"hidden";
NSString *const kUserDeactivatedKey = @"deactivated";

//
NSString *const kUserIDKey = @"uid";
NSString *const kUserSexKey = @"sex";
NSString *const kUserSiteKey = @"site";
NSString *const kUserOnlineKey = @"online";
NSString *const kUserHasPhotoKey = @"has_photo";
NSString *const kUserHasMobileKey = @"has_mobile";
NSString *const kUserFollowersCountKey = @"followers_count";
NSString *const kUserFirstNameKey = @"first_name";
NSString *const kUserLastNameKey = @"last_name";
NSString *const kUserPhoto200Key = @"photo_200_orig";
NSString *const kUserPhoto400Key = @"photo_400_orig";
NSString *const kUserPhotoMaxKey = @"photo_max_orig";
NSString *const kUserBDateKey = @"bdate";
NSString *const kUserLoginKey = @"domain";
NSString *const kUserStatusKey = @"status";
NSString *const kUserUniversitiesKey = @"universities";
NSString *const kUserLastSeenKey = @"last_seen";
NSString *const kUserCityKey = @"city";

+ (instancetype)userFromDictionary:(NSDictionary *)dict {

    SMUser *user = nil;

    if (dict != nil && dict.allKeys > 0) {
        user = [[self alloc] _initWithDictionary:dict];
    }

    return user;
}

- (instancetype)_initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];

    if (self) {
        [self fillFromDictionary:dict];
    }

    return self;
}

// заполняем проперти юзера из словаря
- (void)fillFromDictionary:(NSDictionary *)dict {

    _vkID = [dict integerForKey:kUserIDKey];

    if (dict[kUserHiddenKey]) {
        _hidden = YES;
        return;
    }

    if (dict[kUserDeactivatedKey]) {
        _deactivated = YES;
        return;
    }

    //
    _sex = [dict integerForKey:kUserSexKey];
    _site = [dict stringForKey:kUserSiteKey];

    //
    _cityID = [dict integerForKey:kUserCityKey];

    //
    _online = [dict booleanForKey:kUserOnlineKey];
    _hasPhoto = [dict booleanForKey:kUserHasPhotoKey];
    _hasMobile = [dict booleanForKey:kUserHasMobileKey];
    _followersCount = [dict integerForKey:kUserFollowersCountKey];

    //
    _firstName = [dict stringForKey:kUserFirstNameKey];
    _lastName = [dict stringForKey:kUserLastNameKey];

    //
    _photo200 = [dict stringForKey:kUserPhoto200Key];
    _photo400 = [dict stringForKey:kUserPhoto400Key];
    _photoMax = [dict stringForKey:kUserPhotoMaxKey];

    //
    _bDate = [dict stringForKey:kUserBDateKey];
    _login = [dict stringForKey:kUserLoginKey];
    _status = [dict stringForKey:kUserStatusKey];

    //
    NSArray *universitiesArray = [dict arrayForKey:kUserUniversitiesKey];
    _universities = [SMUniversity universitiesFromArray:universitiesArray];

    NSDictionary *lastSeenDict = [dict dictionaryForKey:kUserLastSeenKey];
    _lastSeen = [SMLastSeen lastSeenFromDictionary:lastSeenDict];
}

// валидный ли юзер
- (BOOL)isValid {

    BOOL isValid = NO;

    if (    _vkID > 0     //
        &&  _cityID > 0   //
        && !_hidden       //
        && !_deactivated  //
        &&  _hasPhoto     //
    ) {

        isValid = YES;
    }

    return isValid;
}

- (void)setCity:(SMCity *)city {
    _city = city;
}

//
+ (NSArray *)userFields {
    return @[
             kUserIDKey,
             kUserFollowersCountKey,
             kUserSexKey,
             kUserSiteKey,
             kUserOnlineKey,
             kUserHasPhotoKey,
             kUserHasMobileKey,
             kUserFirstNameKey,
             kUserLastNameKey,
             kUserPhoto200Key,
             kUserPhoto400Key,
             kUserPhotoMaxKey,
             kUserBDateKey,
             kUserLoginKey,
             kUserStatusKey,
             kUserUniversitiesKey,
             kUserLastSeenKey,
             kUserCityKey,
    ];
}

@end
