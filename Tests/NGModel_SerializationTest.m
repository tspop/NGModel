//
//  NGModel_SerializationTest.m
//  Model
//
//  Created by Silviu Pop on 9/16/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>

// Class being tested
#import "NGModel+Serialization.h"
#import "SimpleModel.h"

@interface NGModel_SerializationTest : GHTestCase
@end

////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NGModel_SerializationTest

- (BOOL)shouldRunOnMainThread
{
  // By default NO, but if you have a UI test or test dependent on running on the main thread return YES.
  // Also an async test that calls back on the main thread, you'll probably want to return YES.
  return NO;
}

#pragma mark - Class setup
- (void)setUpClass
{
  // Run at start of all tests in the class
}

- (void)tearDownClass
{
  // Run at end of all tests in the class
}

#pragma mark - Test setup
- (void)setUp
{
  // Run before each test method
}

- (void)tearDown
{
  // Run after each test method
}

#pragma mark - Tests

- (void)testSimpleDeserialization {
    NSString *testName = @"testName";
    NSString *testCamelCaseName = @"testCamelCaseName";
    NSString *readOnlyString = @"readOnlyString";
    
    NSDictionary *dictionary = @{@"name": testName,
                                @"camelCaseName" : testCamelCaseName,
                                 @"readonlyString" : readOnlyString};
    
    SimpleModel *simpleModel = [SimpleModel create:dictionary];
    
    GHAssertEqualStrings(simpleModel.name, testName, nil);
    GHAssertEqualStrings(simpleModel.camelCaseName, testCamelCaseName, nil);
}

- (void)testSimpleSerialization {
    
    
}

@end
