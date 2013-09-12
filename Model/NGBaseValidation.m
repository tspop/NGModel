//
//  BaseValidation.m
//  Mazak
//
//  Created by Silviu Pop on 7/10/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGBaseValidation.h"

@implementation NGBaseValidation

- (BOOL)isValid:(NGModel *)model {
    return YES;
}

- (BOOL)isInvalid:(NGModel *)model {
    return ![self isValid:model];
}

- (NSString *)errorMessage {
    if (_errorMessage == nil) {
        return [self defaultErrorMessage];
    } else {
        return _errorMessage;
    }
}

- (NSString *)defaultErrorMessage {
    return [NSString stringWithFormat:@"%@ has an error.",self.property];
}

@end
