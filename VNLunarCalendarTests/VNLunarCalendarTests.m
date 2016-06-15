//
//  VNLunarCalendarTests.m
//  VNLunarCalendarTests
//
//  Created by ened on 2016. 6. 13..
//  Copyright © 2016년 netmaid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "VNLunarCalendar.h"
#import "NSDate+Lunar.h"

@interface VNLunarCalendarTests : XCTestCase

@end

@implementation VNLunarCalendarTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
	for (int i = 1900; i < 2049; i++) {
		for (int j = 1; j <= 12; j++) {
			for (int k = 1; k <= 28; k++) {
				[self testYear:i month:j day:k];
			}
		}
	}
	
	[self testNSDateCategory];
}

- (void)testYear:(int)year month:(int)month day:(int)day {
	VNDate* from = [[VNDate alloc] initWithYear:year month:month day:day];
	
	//NSLog(@"==============================");
	//NSLog(@"from: %@", from);
	
	VNDate* to = [VNLunarCalendar lunarDate:from];
	
	//NSLog(@"to lunar: %@", to);
	
	VNDate* final = [VNLunarCalendar solarDate:to];
	
	//NSLog(@"final: %@", final);
	//NSLog(@"==============================");
	
	XCTAssertEqual(from.year, final.year, @"different year: %@, %@", from, final);
	XCTAssertEqual(from.month, final.month, @"different month: %@, %@", from, final);
	XCTAssertEqual(from.day, final.day, @"different day: %@, %@", from, final);
}

- (void)testNSDateCategory {
	NSDate* first = [NSDate date];
	BOOL isLeapMonth = NO;
	NSDate* lunar = [first vnLunarDate:&isLeapMonth];
	NSDate* final = [lunar vnSolarDate:isLeapMonth];
	
	XCTAssert([first vnIsEqualYMD:final], @"different date: %@, %@", first, final);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
