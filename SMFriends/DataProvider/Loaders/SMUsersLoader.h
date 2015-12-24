//
//  SMUsersLoader.h
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SMRequestDelegate.h"

@interface SMUsersLoader : NSObject

- (instancetype)initWithRequestDelegate:(id <SMRequestDelegate>)requestDelegate;

- (void)loadUsersWithSuccess:(void (^)(NSArray *usersArray))success failure:(void (^)(NSError *error))failure;

@end
