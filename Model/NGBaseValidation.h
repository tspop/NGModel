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

- (BOOL)isValid:(NGModel *)model;

@end
