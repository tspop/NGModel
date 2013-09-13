//
//  Pet.h
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel.h"

@class Human;

@interface Pet : NGModel

@property NSString *name;
@property NSNumber *numberOfLegs;
@property NSString *booha;
@property Human *human;

@end
