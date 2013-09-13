//
//  NGModel+Validations.h
//  Model
//
//  Created by Silviu Pop on 9/3/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel.h"
#import "NGRegexValidation.h"
#import "NGRequiredValidation.h"
#import "NGValidationError.h"
#import "NGBlockValidation.h"


@interface NGModel(Validations)

+ (void)required:(NSString *)property, ...;

+ (void)regex:(NSString *)regex forProperty:(NSString *)property;
+ (void)validateWithBlock:(NGValidationBlock)block;
+ (void)addValidation:(NGBaseValidation *)validation;
+ (void)initValidationsCache;

+ (void)initValidations;
+ (NSMutableArray *)validationsArray;
- (NSArray *)validationErrors;
- (BOOL)isValid;
- (BOOL)isInvalid;

@end
