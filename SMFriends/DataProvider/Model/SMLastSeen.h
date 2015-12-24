//
//  SMLastSeen.h
//  t1
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SMPlatform) {
    SMPlatformMobile  = 1, // мобильная версия сайта
    SMPlatformIphone  = 2, // iphone
    SMPlatformIpad    = 3, // ipad
    SMPlatformAndroid = 4, // android
    SMPlatformWphone  = 5, // Windows Phone
    SMPlatformWindows = 6, // Windows 8
    SMPlatformWeb     = 7, // полная версия сайта
};

@interface SMLastSeen : NSObject

- (instancetype)init __unavailable;
+ (instancetype)lastSeenFromDictionary:(NSDictionary *)dict;

@property (nonatomic, strong, readonly) NSDate *date;        // когда
@property (nonatomic, assign, readonly) SMPlatform platform; // платформа

@end
