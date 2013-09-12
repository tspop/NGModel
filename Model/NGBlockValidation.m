//
//  NGBlockValidation.m
//  Model
//
//  Created by Silviu Pop on 9/10/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGBlockValidation.h"

@implementation NGBlockValidation

+ (instancetype)createWithValidationBlock:(NGValidationBlock)validationBlock {
    NGBlockValidation *validation = [self new];
    
    validation.validationBlock = validationBlock;
    validation.property = @"$GLOBAL$";
    
    return validation;
}

- (BOOL)isValid:(NGModel *)model {
    return self.validationBlock(model);
}

- (NSString *)errorMessage {
    return @"Failed custom validation";
}

@end
