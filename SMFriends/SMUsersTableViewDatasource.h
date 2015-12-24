//
//  SMUsersTableViewDatasource.h
//  SMFriends
//
//  Created by Сергей Маркин on 24.12.15.
//  Copyright © 2015 Сергей Маркин. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SMUsersTableViewDatasource : NSObject <UITableViewDataSource>

-(instancetype) initWithTableView:(UITableView *)tableView;

@end
