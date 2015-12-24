//
//  SMNetworkManager.m
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import "SMNetworkManager.h"

#import "AFHTTPRequestOperationManager.h"

@interface SMNetworkManager ()

@property (nonatomic, strong) AFHTTPRequestOperationManager *requestManager;

@property (nonatomic, strong) SMUsersLoader *usersLoader;
@property (nonatomic, strong) SMCityLoader *cityLoader;

@end

@implementation SMNetworkManager

NSString *const kBaseUrl = @"https://api.vk.com/method";
NSString *const kResponseKey = @"response";

NSString *const kVerKey = @"k";
CGFloat const kVerValue = 5.8f;

NSString *const kLandKey = @"lang";
NSString *const kLandValue = @"ru";

- (instancetype)init {
    self = [super init];

    if (self) {

        _requestManager = [AFHTTPRequestOperationManager manager];

        _usersLoader = [[SMUsersLoader alloc] initWithRequestDelegate:self];
        _cityLoader = [[SMCityLoader alloc] initWithRequestDelegate:self];
    }

    return self;
}

- (SMUsersLoader *)userLoader {
    return _usersLoader;
}

- (SMCityLoader *)cityLoader {
    return _cityLoader;
}

#pragma mark - SMRequestDelegate
- (void)loadArrayAtMethod:(NSString *)method params:(NSDictionary *)params success:(void (^)(NSArray *responseArray))success failure:(void (^)(NSError *error))failure {

    NSString *URLString = [NSString stringWithFormat:@"%@/%@", kBaseUrl, method];

    NSMutableDictionary *extraParams = [NSMutableDictionary dictionaryWithDictionary:params];
    extraParams[kVerKey] = @(kVerValue);
    extraParams[kLandKey] = kLandValue;

    [_requestManager POST:URLString parameters:extraParams success:^(AFHTTPRequestOperation *operation, id responseObject) {

        if (success) {
            NSArray *responseArray = responseObject[kResponseKey];
            success(responseArray);
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        if (failure) {
            failure(error);
        }

    }];

}

@end
