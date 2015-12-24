//
//  SMUsersTableView.m
//  SMFriends
//
//  Created by Сергей Маркин on 24.12.15.
//  Copyright © 2015 Сергей Маркин. All rights reserved.
//

#import "SMUsersTableView.h"

@implementation SMUsersTableView

- (instancetype)init {
	self = [super init];
	
	if (self) {
		self.backgroundColor = [UIColor SMGreyColor];
	}
	return self;
}

-(void) updateConstraints {
	[self mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(self.superview);
	}];
	[super updateConstraints];
}

@end
