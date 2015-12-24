//
//  SMUsersViewController.m
//  SMFriends
//
//  Created by Сергей Маркин on 24.12.15.
//  Copyright © 2015 Сергей Маркин. All rights reserved.
//

#import "SMUsersViewController.h"
#import "SMUsersTableView.h"
#import "SMUsersTableViewDatasource.h"
#import "SMUsersTableViewDataCell.h"

@interface SMUsersViewController () <UITableViewDelegate>

@property (nonatomic, strong) SMUsersTableView *usersTableView;
@property (nonatomic, strong) SMUsersTableViewDatasource *usersTableViewDataSource;

@end

@implementation SMUsersViewController

//- (instancetype)init {
	
//}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_usersTableView = [SMUsersTableView new];
	[self.view addSubview:_usersTableView];
	
	_usersTableViewDataSource = [[SMUsersTableViewDatasource alloc] initWithTableView:_usersTableView];
	
	_usersTableView.delegate = self;
	_usersTableView.dataSource = _usersTableViewDataSource;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return [SMUsersTableViewDataCell getCellHeight];
}

@end
