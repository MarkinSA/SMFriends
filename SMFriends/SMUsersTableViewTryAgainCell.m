//
//  SMUsersTableViewTryAgainCell.m
//  SMFriends
//
//  Created by Сергей Маркин on 24.12.15.
//  Copyright © 2015 Сергей Маркин. All rights reserved.
//

#import "SMUsersTableViewTryAgainCell.h"

@interface SMUsersTableViewTryAgainCell	()

@property (nonatomic, strong) UIButton *tryAgainButton;

@end

@implementation SMUsersTableViewTryAgainCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
	if (self) {
		
		self.backgroundColor = [UIColor SMPistachioColor];
		
		_tryAgainButton = [UIButton new];
		_tryAgainButton.backgroundColor = [UIColor SMOliveColor];
		_tryAgainButton.layer.cornerRadius = 15.0;
		[_tryAgainButton setTitle:@"Try Again" forState:UIControlStateNormal];
		[_tryAgainButton addTarget:self action:@selector(tryAgain) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:_tryAgainButton];
	}
	return self;
}

- (void) updateConstraints {
	
	[_tryAgainButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(self.mas_centerX);
		make.centerY.equalTo(self.mas_centerY);
		make.width.equalTo(@100);
		make.height.equalTo(@50);
	}];
	
	[super updateConstraints];
}

- (void)tryAgain {

}


@end
