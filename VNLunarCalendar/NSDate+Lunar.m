//
//  NSDate+Lunar.m
//  VNLunarCalendar
//
//  Created by ened on 2016. 6. 15..
//  Copyright © 2016년 netmaid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+Lunar.h"
#import "lunar.h"


@implementation NSDate (VNLunarCalendar)

-(NSDate*)vnLunarDate:(BOOL*)isLeapMonth {
	NSDateComponents* fromComp = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self];
	
	vndate_t from, to;
	
	from.year = (uint) fromComp.year;
	from.month = (uint) fromComp.month;
	from.day = (uint) fromComp.day;
	from.leap = false;
	
	vn_sol2lun(&to, &from);
	
	NSDateComponents* toComp = [[NSDateComponents alloc] init];
	toComp.year = to.year;
	toComp.month = to.month;
	toComp.day = to.day;
	//*isLeapMonth = to.leap;
	
	return [[NSCalendar currentCalendar] dateFromComponents:toComp];
}

-(NSDate*)vnSolarDate:(BOOL)isLeapMonth {
	NSDateComponents* fromComp = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self];
	
	vndate_t from, to;
	
	from.year = (uint) fromComp.year;
	from.month = (uint) fromComp.month;
	from.day = (uint) fromComp.day;
	from.leap = isLeapMonth;
	
	vn_lun2sol(&to, &from);
	
	NSDateComponents* toComp = [[NSDateComponents alloc] init];
	toComp.year = to.year;
	toComp.month = to.month;
	toComp.day = to.day;
	
	return [[NSCalendar currentCalendar] dateFromComponents:toComp];
}

-(BOOL)vnIsEqualYMD:(NSDate*)otherDate {
	NSDateComponents* selfComp = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self];
	
	NSDateComponents* otherComp = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:otherDate];
	
	return selfComp.year == otherComp.year && selfComp.month == otherComp.month && selfComp.day == otherComp.day;
}

@end
