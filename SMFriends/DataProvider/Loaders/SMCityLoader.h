//
//  SMCityLoader.h
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SMRequestDelegate.h"

@interface SMCityLoader : NSObject

- (instancetype)initWithRequestDelegate:(id <SMRequestDelegate>)requestDelegate;

- (void)loadCityAtCityID:(NSInteger)cityID success:(void (^)(SMCity *city))success failure:(void (^)(NSError *error))failure;

@end
