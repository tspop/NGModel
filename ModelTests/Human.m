//
//  Human.m
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "Human.h"

@implementation Human

+ (void)initValidations {
    [self required:@"name",nil];
    [self validateWithBlock:^BOOL(Human *human) {
        return human.id % 2 == 0;
    }];
    [self addValidation:[NGRegexValidation emailValidationForProperty:@"name"]];
}

@end
