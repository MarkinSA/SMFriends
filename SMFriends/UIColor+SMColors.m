//
//  UIColor+SMColors.m
//  SMFriends
//
//  Created by Сергей Маркин on 24.12.15.
//  Copyright © 2015 Сергей Маркин. All rights reserved.
//

#import "UIColor+SMColors.h"

@implementation UIColor (SMColors)

+ (UIColor *)colorWithHex:(NSUInteger)hexColor alpha:(CGFloat)alpha {
	
	return [UIColor colorWithRed:((CGFloat) ((hexColor & 0xff0000) >> 16)) / 255.0f
						   green:((CGFloat) ((hexColor & 0xff00)   >>  8)) / 255.0f
							blue:((CGFloat) ((hexColor & 0xff)     >>  0)) / 255.0f
						   alpha:alpha];
}

+ (UIColor *)colorWithHex:(NSUInteger)hexColor {
	return [self colorWithHex:hexColor alpha:1.0];
}

+ (UIColor *) SMGreyColor {
	return [self colorWithHex:0xC9C8BE];
}

+ (UIColor *) SMCementColor {
	return [self colorWithHex:0xb2a7a6];
}

+ (UIColor *) SMOrangeColor {
	return [self colorWithHex:0xbe5c13];
}

+ (UIColor *) SMPeachColor {
	return [self colorWithHex:0xecb886];
}

+ (UIColor *) SMSnowColor {
	return [self colorWithHex:0xf4f4f6];
}

+ (UIColor *) SMSkyColor {
	return [self colorWithHex:0x92bccf];
}

+ (UIColor *) SMOliveColor {
	return [self colorWithHex:0xa0965c];
}

+ (UIColor *) SMPistachioColor {
	return [self colorWithHex:0xd9dfab];
}

+ (UIColor *) SMSwampColor {
	return [self colorWithHex:0x4c4c41];
}

@end
