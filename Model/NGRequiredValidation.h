//
//  RequiredValidation.h
//  Mazak
//
//  Created by Silviu Pop on 7/10/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGBaseValidation.h"

@interface NGRequiredValidation : NGBaseValidation

@property (strong, nonatomic) NSString *property;

+ (instancetype)createWithProperty:(NSString *)property;

@end
