//
//  AppDelegate.m
//  SMFriends
//
//  Created by Сергей Маркин on 24.12.15.
//  Copyright © 2015 Сергей Маркин. All rights reserved.
//

#import "AppDelegate.h"
#import "SMUsersViewController.h"
#import "SMNavigationController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	SMUsersViewController *vc = [SMUsersViewController new];
	SMNavigationController *nc = [[SMNavigationController alloc] initWithRootViewController:vc];
	self.window.rootViewController = nc;
	[self.window makeKeyAndVisible];
	
	return YES;
}

@end
