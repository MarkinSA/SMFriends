//
//  SMUniversity.h
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMUniversity : NSObject

- (instancetype)init __unavailable;
+ (NSArray *)universitiesFromArray:(NSArray *)array;

@property (nonatomic, strong, readonly) NSString *name;       // название
@property (nonatomic, strong, readonly) NSString *faculty;    // факультет
@property (nonatomic, assign, readonly) NSInteger graduation; // год выпуска

@end
