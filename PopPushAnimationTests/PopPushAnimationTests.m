//
//  PopPushAnimationTests.m
//  PopPushAnimationTests
//
//  Created by Pengbo on 2016/12/9.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface PopPushAnimationTests : XCTestCase

@end

@implementation PopPushAnimationTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSLog(@"自定义测试testExample");
    int a =3;
    XCTAssertTrue(a == 3,"a等于3");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
