//
//  SMCity.h
//  t1
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMCity : NSObject

- (instancetype)init __unavailable;
+ (instancetype)cityFromDictionary:(NSDictionary *)dict;

@property (nonatomic, assign, readonly) NSInteger cityID;
@property (nonatomic, strong, readonly) NSString *name;

@end
