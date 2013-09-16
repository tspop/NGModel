//
//  SimpleModel.h
//  Model
//
//  Created by Silviu Pop on 9/16/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel.h"

@interface SimpleModel : NGModel

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *camelCaseName;
@property (strong, nonatomic) NSNumber *number;
@property int intNumber;
@property (readonly, nonatomic) NSString *readonlyString;
@property (strong, atomic) NSString *atomicString;

@property (strong, nonatomic) NSString *customSetterString;

@end
