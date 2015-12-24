//
//  NSDictionary+SMHelper.h
//  t1
//
//  Created by Михаил on 12/24/15.
//  Copyright © 2015 Mikhail Shershnev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SMHelper)

- (BOOL)booleanForKey:(NSString *)key;
- (NSInteger)integerForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;

- (NSArray *)arrayForKey:(NSString *)key;
- (NSDictionary *)dictionaryForKey:(NSString *)key;

@end
