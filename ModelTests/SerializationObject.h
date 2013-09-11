//
//  SerializationObject.h
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel.h"

@interface SubObject : NGModel
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *date;
@end

@interface SerializationObject : NGModel

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *otherName;
@property (strong, nonatomic) NSNumber *someNumber;
@property (strong, nonatomic) NSArray *someArray;

@end
