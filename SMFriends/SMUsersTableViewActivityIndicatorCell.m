//
//  SMUsersTableViewActivityIndicatorCell.m
//  SMFriends
//
//  Created by Сергей Маркин on 24.12.15.
//  Copyright © 2015 Сергей Маркин. All rights reserved.
//

#import "SMUsersTableViewActivityIndicatorCell.h"

@interface SMUsersTableViewActivityIndicatorCell ()

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end


@implementation SMUsersTableViewActivityIndicatorCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
	if (self) {
		
		self.backgroundColor = [UIColor SMPistachioColor];
		self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		
		[self addSubview:self.activityIndicator];
		
		self.activityIndicator.hidesWhenStopped = NO;
		[self.activityIndicator startAnimating];
	}
	
	return self;
}

- (void)updateConstraints {
	
	[self.activityIndicator mas_makeConstraints:^(MASConstraintMaker *make){
	make.centerX.equalTo(self.mas_centerX);
	make.centerY.equalTo(self.mas_centerY);
	}];
	
	[super updateConstraints];
}

- (void)layoutSubviews {
	
	[super layoutSubviews];
	[self.activityIndicator startAnimating];
}

@end
