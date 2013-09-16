//
//  NGModel_ValidationsTest.m
//  Model
//
//  Created by Silviu Pop on 9/16/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>

// Class being tested
#import "NGModel+Validations.h"

@interface NGModel_ValidationsTest : GHTestCase
@end

////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NGModel_ValidationsTest

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
- (void)testRequiredValidation {
    
}

- (void)testRegexValidation {
    
}


@end
