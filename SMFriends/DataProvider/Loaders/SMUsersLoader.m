//
//  SMUsersLoader.m
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import "SMUsersLoader.h"

@interface SMUsersLoader ()

@property (nonatomic, assign) NSInteger lastUserID;
@property (nonatomic, weak) id <SMRequestDelegate> requestDelegate;

@end

@implementation SMUsersLoader

NSString *const kUsersGetMethod = @"users.get";
NSInteger const kUsersGetLimit = 10;

NSString *const kFieldsKey  = @"fields";
NSString *const kUserIDsKey = @"user_ids";

- (instancetype)initWithRequestDelegate:(id <SMRequestDelegate>)requestDelegate {

    self = [super init];

    if (self) {
        _lastUserID = 0;
        _requestDelegate = requestDelegate;
    }

    return self;
}

// загрузим юзеров после lastUserID
- (void)loadUsersWithSuccess:(void (^)(NSArray *usersArray))success failure:(void (^)(NSError *error))failure {

    //
    NSInteger newUserID = _lastUserID + 1;
    NSMutableArray *userIDs = [NSMutableArray new];

    for (NSInteger index = 0; index < kUsersGetLimit; index++) {

        NSInteger userID = newUserID + index;
        [userIDs addObject:@(userID)];
    }

    NSString *userIDsString = [userIDs componentsJoinedByString:@","];

    //
    NSArray *userFieldsArray = [SMUser userFields];
    NSString *userFieldsString = [userFieldsArray componentsJoinedByString:@","];

    NSDictionary *params = @{
                             kUserIDsKey:  userIDsString,
                             kFieldsKey:   userFieldsString,
    };

    [_requestDelegate loadArrayAtMethod:kUsersGetMethod params:params success:^(NSArray *responseArray) {

        NSMutableArray *validUsers = [NSMutableArray new];

        for (NSDictionary *userDict in responseArray) {

            SMUser *user = [SMUser userFromDictionary:userDict];

            if ([user isValid]) {
                [validUsers addObject:user];
            }

            _lastUserID = user.vkID;
        }

        if (success) {
            success(validUsers);
        }

    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];

}

@end
