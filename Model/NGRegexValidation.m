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
    
    NSString *emailRegex = @"^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,4})$";
    return [self createWithProperty:property andRegex:emailRegex];
}

+ (instancetype)phoneNumberValidationForProperty:(NSString *)property {
    NSString *phoneNumberRegex = @"^(?:(?:\\+?1\\s*(?:[.-]\\s*)?)?(?:\\(\\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\\s*\\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\\s*(?:[.-]\\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\\s*(?:[.-]\\s*)?([0-9]{4})(?:\\s*(?:#|x\\.?|ext\\.?|extension)\\s*(\\d+))?$";
    return [self createWithProperty:property andRegex:phoneNumberRegex];
}

- (BOOL)isValid:(NGModel *)model {
    id value = [model valueForKey:self.property];
    
    if (value == nil) {
        return NO;
    }
    
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:self.regex options:NSRegularExpressionCaseInsensitive error:nil];
    
    return [regularExpression numberOfMatchesInString:value options:0 range:NSMakeRange(0, [value length])];
}

- (NSString *)defaultErrorMessage {
    return [NSString stringWithFormat:@"%@ failed regex",self.property];
}

@end
