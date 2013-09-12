//
//  BaseValidation.h
//  Mazak
//
//  Created by Silviu Pop on 7/10/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NGModel.h"

@interface NGBaseValidation : NSObject

@property (strong, nonatomic) NSString *property;
@property (strong, nonatomic) NSString *errorMessage;

- (BOOL)isValid:(NGModel *)model;
- (BOOL)isInvalid:(NGModel *)model;
- (NSString *)defaultErrorMessage;

@end
