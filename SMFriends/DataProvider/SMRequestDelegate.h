//
//  SMRequestDelegate.h
//  t1
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SMCity.h"
#import "SMUser.h"

@protocol SMRequestDelegate

- (void)loadArrayAtMethod:(NSString *)method params:(NSDictionary *)params success:(void (^)(NSArray *responseArray))success failure:(void (^)(NSError *error))failure;

@end
