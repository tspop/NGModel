//
//  NGValidationError.h
//  Model
//
//  Created by Silviu Pop on 9/12/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NGBaseValidation.h"

@interface NGValidationError : NSObject

@property (strong, nonatomic) NSString *property;
@property (strong, nonatomic) NSMutableArray *messages;

+ (instancetype)createWithValidation:(NGBaseValidation *)validation;

@end
