//
//  VNLunarCalendar.m
//  VNLunarCalendar
//
//  Created by ened on 2016. 6. 12..
//  Copyright © 2016년 netmaid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VNLunarCalendar.h"
#import "lunar.h"


@implementation VNDate

-(instancetype)init {
	if (self = [super init]) {
		_year = 0;
		_month = 0;
		_day = 0;
	}
	return self;
}

-(instancetype)initWithYear:(uint)year month:(uint)month day:(uint)day {
	return [self initWithYear:year month:month day:day leap:false];
}

-(instancetype)initWithYear:(uint)year month:(uint)month day:(uint)day leap:(BOOL)leap {
	if (self = [super init]) {
		_year = year;
		_month = month;
		_day = day;
		_leap = leap;
	}
	return self;
}

-(NSString*)description {
	return [NSString stringWithFormat:@"%4d-%02d-%02d", _year, _month, _day];
}
@end


@implementation VNLunarCalendar

+(VNDate*)lunarDate:(VNDate*)date {
	vndate_t from, to;
	
	from.year = date.year;
	from.month = date.month;
	from.day = date.day;
	from.leap = false;
	
	vn_sol2lun(&to, &from);
	
	return [[VNDate alloc] initWithYear:to.year month:to.month day:to.day leap:to.leap];
}


+(VNDate*)solarDate:(VNDate*)date {
	vndate_t from, to;
	
	from.year = date.year;
	from.month = date.month;
	from.day = date.day;
	from.leap = date.leap;
	
	vn_lun2sol(&to, &from);
	
	return [[VNDate alloc] initWithYear:to.year month:to.month day:to.day leap:to.leap];
}

@end
