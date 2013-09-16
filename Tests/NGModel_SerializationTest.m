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
#import "Duck.h"

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
    NSString *customSetterString = @"customSetterString";
    
    NSDictionary *dictionary = @{@"name": testName,
                                @"camelCaseName" : testCamelCaseName,
                                 @"readonlyString" : readOnlyString,
                                 @"customSetterString" : customSetterString};
    
    SimpleModel *simpleModel = [SimpleModel create:dictionary];
    
    GHAssertEqualStrings(simpleModel.name, testName, nil);
    GHAssertEqualStrings(simpleModel.camelCaseName, testCamelCaseName, nil);
    GHAssertEqualStrings(simpleModel.customSetterString, [customSetterString stringByAppendingString:@"CUSTOMIZED"], nil);
}

- (void)testSimpleSerialization {
    SimpleModel *simpleModel = [SimpleModel randomInstance];
    
    NSDictionary *dictionary = [simpleModel serialize];
    
    GHAssertEqualStrings(dictionary[@"name"], simpleModel.name, nil);
    GHAssertEqualStrings(dictionary[@"camelCaseName"], simpleModel.camelCaseName, nil);
}

- (void)testInheritanceSerialization {
    Duck *duck = [Duck new];
    duck.name = @"Fluffy";
    duck.numberOfFeathers = @12423532;
    
    NSDictionary *dictionary = [duck serialize];
    
    GHAssertEqualStrings(dictionary[@"name"], duck.name, nil);
    GHAssertEquals(dictionary[@"numberOfFeathers"], duck.numberOfFeathers, [dictionary description]);
}

- (void)testOnly {
    SimpleModel *onlyModel = [SimpleModel randomInstance];
    
    NSDictionary *dictionary = [onlyModel serializeOnly:@"name, camelCaseName"];
    
    GHAssertEqualStrings(dictionary[@"name"], onlyModel.name,nil);
    GHAssertEquals(dictionary.allKeys.count, 2u, nil);
}

- (void)testExcept {
    Duck *duck = [Duck randomInstance];
    
    NSDictionary *dictionary = [duck serializeExcept:@"numberOfFeathers"];
    
    GHAssertEquals(dictionary.allKeys.count, 1u, nil);
}



@end
