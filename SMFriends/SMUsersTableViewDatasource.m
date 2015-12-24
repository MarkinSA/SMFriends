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

#import "SMNetworkManager.h"

@interface SMUsersTableViewDatasource ()

@property (nonatomic, strong) SMNetworkManager *networkManager;

@end

@implementation SMUsersTableViewDatasource

NSString *const dataCellIdentifier = @"dataCellIdentifier";

-(instancetype) initWithTableView:(UITableView *)tableView {
	self = [super init];
	
	if (self) {

        // создали нетворк менеджер
        _networkManager = [SMNetworkManager new];

		[tableView registerClass:[SMUsersTableViewDataCell class] forCellReuseIdentifier:dataCellIdentifier];

        [[_networkManager userLoader] loadUsersWithSuccess:^(NSArray *usersArray) {

            NSLog(@"new users downloaded successful");
            for (SMUser *user in usersArray) {
                NSLog(@"%@", user);
            }

        } failure:^(NSError *error) {

            NSLog(@"%@", error);

        }];
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
