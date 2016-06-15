//
//  VNLunarCalendar.h
//  VNLunarCalendar
//
//  Created by ened on 2016. 6. 12..
//  Copyright © 2016년 netmaid. All rights reserved.
//

@interface VNDate : NSObject

@property (assign, nonatomic) uint year;
@property (assign, nonatomic) uint month;
@property (assign, nonatomic) uint day;
@property (assign, nonatomic) BOOL leap;

-(instancetype)initWithYear:(uint)year month:(uint)month day:(uint)day;
-(instancetype)initWithYear:(uint)year month:(uint)month day:(uint)day leap:(BOOL)leap;

@end


@interface VNLunarCalendar : NSObject

+(VNDate*)lunarDate:(VNDate*)date;
+(VNDate*)solarDate:(VNDate*)date;

@end
