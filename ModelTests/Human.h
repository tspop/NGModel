//
//  Human.h
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel+Caching.h"

@interface Human : NGModel

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSNumber *money;
@property (strong, nonatomic) NSString *petsName;
@property (strong, nonatomic) NSArray *hobbies;
@property (strong, nonatomic) NSNumber *age;
@property int id;

@end
