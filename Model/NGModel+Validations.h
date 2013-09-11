//
//  NGModel+Validations.h
//  Model
//
//  Created by Silviu Pop on 9/3/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel.h"

@interface NGModel(Validations)

+ (void)required:(NSString *)property, ...;
+ (void)regex:(NSString *)regex forProperty:(NSString *)property;
+ (NSMutableArray *)validationsArray;

@end
