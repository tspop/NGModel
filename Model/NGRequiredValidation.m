//
//  RequiredValidation.m
//  Mazak
//
//  Created by Silviu Pop on 7/10/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGRequiredValidation.h"

@implementation NGRequiredValidation

+ (instancetype)createWithProperty:(NSString *)property {
    NGRequiredValidation *result = [self new];
    
    result.property = property;
    
    return result;
}

- (BOOL)isValid:(NGModel *)model {
    id value = [model valueForKey:self.property];
    
    if ([value isKindOfClass:[NSString class]] && [value length] > 0) {
        return YES;
    }
    
    return value != nil;
}

- (NSString *)defaultErrorMessage {
    return [NSString stringWithFormat:@"%@ is required.",self.property];
}

@end
