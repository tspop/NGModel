//
//  NGModel.h
//  Model
//
//  Created by Silviu Pop on 8/22/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NGModel : NSObject

- (NSString *)className;
+ (NSString *)className;

@end

#import "NGModel+Serialization.h"
#import "NGModel+Validations.h"
#import "NGModel+Instantation.h"
