//
//  SMUsersTableViewDatasource.m
//  SMFriends
//
//  Created by Сергей Маркин on 24.12.15.
//  Copyright © 2015 Сергей Маркин. All rights reserved.
//

#import "SMUsersTableViewDatasource.h"
#import "SMUsersTableViewDataCell.h"
#import "SMUsersTableViewActivityIndicatorCell.h"
#import "SMUsersTableViewTryAgainCell.h"

@interface SMUsersTableViewDatasource ()

@end

@implementation SMUsersTableViewDatasource

NSString *const dataCellIdentifier = @"dataCellIdentifier";

-(instancetype) initWithTableView:(UITableView *)tableView {
	self = [super init];
	
	if (self) {
		
		[tableView registerClass:[SMUsersTableViewDataCell class] forCellReuseIdentifier:dataCellIdentifier];

	}
	return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	SMUsersTableViewDataCell *usersTableViewDataCell = [tableView dequeueReusableCellWithIdentifier:dataCellIdentifier];
	
	return usersTableViewDataCell;
	
}

@end
