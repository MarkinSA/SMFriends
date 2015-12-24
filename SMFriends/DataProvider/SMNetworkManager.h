//
//  SMNetworkManager.h
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SMUsersLoader.h"
#import "SMCityLoader.h"

#import "SMRequestDelegate.h"

@interface SMNetworkManager : NSObject <SMRequestDelegate>

- (SMUsersLoader *)userLoader;
- (SMCityLoader *)cityLoader;

@end
