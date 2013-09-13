//
//  BaseValidation.h
//  Mazak
//
//  Created by Silviu Pop on 7/10/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NGModel;

@interface NGBaseValidation : NSObject

@property (strong, nonatomic) NSString *property;
@property (strong, nonatomic) NSString *errorMessage;

- (BOOL)isValid:(NGModel *)model;
- (NSString *)defaultErrorMessage;

@end
