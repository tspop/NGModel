//
//  RegexValidation.h
//  Mazak
//
//  Created by Silviu Pop on 7/10/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGBaseValidation.h"

@interface NGRegexValidation : NGBaseValidation

@property (strong, nonatomic) NSString *property;
@property (strong, nonatomic) NSString *regex;

+ (instancetype)createWithProperty:(NSString *)property andRegex:(NSString *)regex;
+ (instancetype)emailValidationForProperty:(NSString *)property;
+ (instancetype)phoneNumberValidationForProperty:(NSString *)property;

@end
