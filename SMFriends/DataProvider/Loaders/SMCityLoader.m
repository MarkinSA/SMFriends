//
//  SMCityLoader.m
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import "SMCityLoader.h"

@interface SMCityLoader ()

@property (nonatomic, weak) id <SMRequestDelegate> requestDelegate;

@end

@implementation SMCityLoader

NSString *const kGetCitiesMethod = @"database.getCitiesById";
NSString *const kCityIDsKey = @"city_ids";

- (instancetype)initWithRequestDelegate:(id <SMRequestDelegate>)requestDelegate {

    self = [super init];

    if (self) {
        _requestDelegate = requestDelegate;
    }

    return self;
}

- (void)loadCityAtCityID:(NSInteger)cityID success:(void (^)(SMCity *city))success failure:(void (^)(NSError *error))failure {

    NSDictionary *params = @{
                             kCityIDsKey: @(cityID),
                             };

    [_requestDelegate loadArrayAtMethod:kGetCitiesMethod params:params success:^(NSArray *responseArray) {

        if (responseArray != nil && responseArray.count > 0) {

            if (success) {
                NSDictionary *cityDict = responseArray.firstObject;
                SMCity *city = [SMCity cityFromDictionary:cityDict];

                if (city) {
                    success(city);
                }
                else {
                    if (failure) {
                        NSError *error = [NSError new];
                        failure(error);
                    }
                }
                
            }

        }
        else {
            if (failure) {
                NSError *error = [NSError new];
                failure(error);
            }
        }

    } failure:^(NSError *error) {

        if (failure) {
            failure(error);
        }

    }];

}

@end
