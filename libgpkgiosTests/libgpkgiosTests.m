//
//  libgpkgiosTests.m
//  libgpkgiosTests
//
//  Created by Wes Richardet on 3/16/16.
//  Copyright © 2016 tetriscodes. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Test.h"

@interface libgpkgiosTests : XCTestCase

@end

@implementation libgpkgiosTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
  Test *t = [Test new];
  [t doIt];
}

@end
