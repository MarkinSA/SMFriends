//
//  SMUser.h
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SMCity.h"
#import "SMLastSeen.h"

typedef NS_ENUM(NSInteger, SMUserSex) {
    SMUserSexUnknown = 0, // неизвестный пол
    SMUserSexFemale  = 1, // женщина
    SMUserSexMale    = 2, // мужчина
};

@interface SMUser : NSObject

- (instancetype)init __unavailable;
+ (instancetype)userFromDictionary:(NSDictionary *)dict;

- (BOOL)isValid;
- (void)setCity:(SMCity *)city;

+ (NSArray *)userFields;

@property (nonatomic, assign, readonly) NSInteger vkID;   // айди
@property (nonatomic, assign, readonly) NSInteger followersCount; // количество подписчиков

@property (nonatomic, assign, readonly) SMUserSex sex; // пол

@property (nonatomic, strong, readonly) SMCity *city;  // город
@property (nonatomic, assign, readonly) NSInteger cityID;  // айди города

@property (nonatomic, assign, readonly) BOOL online;    // онлайн или нет
@property (nonatomic, assign, readonly) BOOL hasMobile; // есть мобила или нет
@property (nonatomic, assign, readonly) BOOL hasPhoto;  // есть ли фотка

@property (nonatomic, strong, readonly) NSString *site;      // сайт
@property (nonatomic, strong, readonly) NSString *firstName; // имя
@property (nonatomic, strong, readonly) NSString *lastName;  // фамилия

@property (nonatomic, strong, readonly) NSString *photo200; // ссылка на фотку с шириной 200px
@property (nonatomic, strong, readonly) NSString *photo400; // ссылка на фотку с шириной 400px
@property (nonatomic, strong, readonly) NSString *photoMax; // ссылка на фотку с максимальной шириной

@property (nonatomic, strong, readonly) NSString *bDate;  // дата рождения

@property (nonatomic, strong, readonly) NSString *login;  // логин, например mshershnev
@property (nonatomic, strong, readonly) NSString *status; // статус, например "Нарисуй на ладонях звезды"

@property (nonatomic, strong, readonly) NSArray *universities; // университеты
@property (nonatomic, strong, readonly) SMLastSeen *lastSeen; // время последнего посещения

@end
