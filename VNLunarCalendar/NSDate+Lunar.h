//
//  NSDate+Lunar.h
//  VNLunarCalendar
//
//  Created by ened on 2016. 6. 15..
//  Copyright © 2016년 netmaid. All rights reserved.
//


@interface NSDate (VNLunarCalendar)

-(NSDate*)vnLunarDate:(BOOL*)isLeapMonth;
-(NSDate*)vnSolarDate:(BOOL)isLeapMonth;

-(BOOL)vnIsEqualYMD:(NSDate*)otherDate;

@end
