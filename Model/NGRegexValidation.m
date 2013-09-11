//
//  RegexValidation.m
//  Mazak
//
//  Created by Silviu Pop on 7/10/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGRegexValidation.h"

@implementation NGRegexValidation

+ (instancetype)createWithProperty:(NSString *)property andRegex:(NSString *)regex {
    NGRegexValidation *result = [self new];

    result.property = property;
    result.regex = regex;
    
    return result;
}

+ (instancetype)emailValidationForProperty:(NSString *)property {
    return [self createWithProperty:property andRegex:@""];
}

+ (instancetype)phoneNumberValidationForProperty:(NSString *)property {
    return [self createWithProperty:property andRegex:@""];
}

- (BOOL)isValid:(NGModel *)model {
    id value = [model valueForKey:self.property];
    
    if (value == nil) {
        return NO;
    }
    
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:self.regex options:NSRegularExpressionCaseInsensitive error:nil];
    
    return [regularExpression numberOfMatchesInString:value options:0 range:NSMakeRange(0, [value length])];
}

@end
