//
//  NGBlockValidation.h
//  Model
//
//  Created by Silviu Pop on 9/10/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGBaseValidation.h"

typedef BOOL (^NGValidationBlock)(id);

@interface NGBlockValidation : NGBaseValidation

@property (copy, nonatomic) NGValidationBlock validationBlock;

+ (instancetype)createWithValidationBlock:(NGValidationBlock)validationBlock;

@end
