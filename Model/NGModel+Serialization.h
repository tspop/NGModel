//
//  NGModel+Serialization.h
//  Model
//
//  Created by Silviu Pop on 9/3/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel.h"

@interface NGModel(Serialization)

- (id)serialize;
- (id)serializeAsDictionary;

+ (id)create:(id)data;
+ (id)createFromDictionary:(NSDictionary *)dictionary;

@end
