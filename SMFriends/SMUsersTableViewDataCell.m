//
//  SMUsersTableViewDataCell.m
//  SMFriends
//
//  Created by Сергей Маркин on 24.12.15.
//  Copyright © 2015 Сергей Маркин. All rights reserved.
//

#import "SMUsersTableViewDataCell.h"

@interface SMUsersTableViewDataCell	()

@property (nonatomic, strong) UIImageView *avatar;
@property (nonatomic, strong) UIImageView *status;
@property (nonatomic, strong) UILabel *name;

@end

@implementation SMUsersTableViewDataCell

CGFloat const basicIndent = 5.0;
CGFloat const cellHeight = 100.0;
CGFloat const avatarWidth = cellHeight - (2 * basicIndent);
CGFloat const statusFrame = 30;
CGFloat const statusIndent = 20;


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
	if (self) {
		
		self.backgroundColor = [UIColor whiteColor];
		
		_avatar = [UIImageView new];
		_avatar.backgroundColor = [UIColor SMPeachColor];
		_avatar.layer.cornerRadius = avatarWidth/2;
		_avatar.clipsToBounds = YES;
		[self addSubview:_avatar];
		
		_status = [UIImageView new];
		_status.backgroundColor = [UIColor SMPeachColor];
		//[_status setImage:[UIImage imageNamed:@"status_offline.png"]];
		[self addSubview:_status];
		
		_name = [UILabel new];
		_name.backgroundColor = [UIColor SMPeachColor];
		_name.font = [UIFont systemFontOfSize:18.0];
		_name.textColor = [UIColor SMSwampColor];
		[_name setText:@"Random Text"];
		[self addSubview:_name];
		
	}
	return self;
}

- (void) updateConstraints {
	
	[_avatar mas_makeConstraints:^(MASConstraintMaker *make){
		make.top.equalTo(self.mas_top).with.offset(basicIndent);
		make.leading.equalTo(self.mas_leading).with.offset(basicIndent);
		make.bottom.equalTo(self.mas_bottom).with.offset(-basicIndent);
		make.width.equalTo(@(avatarWidth));
	}];
	
	[_status mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerY.equalTo(self.mas_centerY);
		make.trailing.equalTo(self.mas_trailing).with.offset(-statusIndent);
		make.height.equalTo(@(statusFrame));
		make.width.equalTo(@(statusFrame));
	}];
	
	[_name mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerY.equalTo(self.mas_centerY);
		make.leading.equalTo(_avatar.mas_trailing).with.offset(basicIndent);
		make.trailing.equalTo(_status.mas_leading).with.offset(-basicIndent);
	}];
	
	[super updateConstraints];
}

+ (CGFloat)getCellHeight {
	return cellHeight;
}

-(void)prepareForReuse {
	[super prepareForReuse];
	//self.avatar.image = nil;
	//self.status.image = nil;
	//self.name.text = nil;
}
						   
@end