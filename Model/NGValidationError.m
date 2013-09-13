//
//  NGValidationError.m
//  Model
//
//  Created by Silviu Pop on 9/12/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGValidationError.h"

@implementation NGValidationError

+ (instancetype)createWithValidation:(NGBaseValidation *)validation {
    NGValidationError *error = [NGValidationError new];
    
    error.property = validation.property;
    error.messages = [NSMutableArray array];
    
    return error;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@: %@",self.property,self.messages];
}

@end
