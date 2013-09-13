//
//  NGModel+Validations.m
//  Model
//
//  Created by Silviu Pop on 9/3/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel+Validations.h"

@implementation NGModel(Validations)

static NSMutableDictionary *validations;

+ (NSMutableArray *)validationsArray {
    return validations[NSStringFromClass(self)];
}

+ (void)initValidationsCache {
    if (self == NGModel.class) {
        return;
    }
    [self.superclass initValidationsCache];
    
    if (validations == nil) {
        validations = [NSMutableDictionary dictionary];
    }
    
    NSString *className = self.className;
    
    if (!validations[className]) {
        validations[className] = [NSMutableArray array];
        [self initValidations];
    }
}

+ (void)initValidations {
    [self initValidationsCache];
}

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

+ (void)validateWithBlock:(NGValidationBlock)block {
    NSMutableArray *validationsArray = [self validationsArray];
    
    [validationsArray addObject:[NGBlockValidation createWithValidationBlock:block]];
}

- (NSArray *)validationErrors {
    NSMutableDictionary *errors = [NSMutableDictionary dictionary];
    for (NGBaseValidation *validation in [self.class validationsArray]) {
        if (![validation isValid:self]) {
            NGValidationError *error = errors[validation.property];
            
            if (error == nil) {
                error = [NGValidationError createWithValidation:validation];
            }
            
            [error.messages addObject:[validation errorMessage]];
            errors[validation.property] = error;
        }
    }
    return [errors allValues];
}

+ (void)addValidation:(NGBaseValidation *)validation {
    [[self validationsArray] addObject:validation];
}

- (BOOL)isValid {
    for (NGBaseValidation *validation in [self.class validationsArray]) {
        if (![validation isValid:self]) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)isInvalid {
    return ![self isValid];
}

@end
