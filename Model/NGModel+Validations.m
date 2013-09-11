//
//  NGModel+Validations.m
//  Model
//
//  Created by Silviu Pop on 9/3/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel+Validations.h"
#import "NGRegexValidation.h"
#import "NGRequiredValidation.h"

@implementation NGModel(Validations)

+ (void)required:(NSString *)property, ... {
    NSMutableArray *validationsArray = [self validationsArray];
    va_list args;
    va_start(args, property);
    for (NSString *arg = property; arg != nil; arg = va_arg(args, NSString*))
    {
        [validationsArray addObject:[NGRequiredValidation createWithProperty:arg]];
    }
    va_end(args);
}

+ (void)regex:(NSString *)regex forProperty:(NSString *)property {
    NSMutableArray *validationsArray = [self validationsArray];
    
    [validationsArray addObject:[NGRegexValidation createWithProperty:property andRegex:regex]];
}

@end
