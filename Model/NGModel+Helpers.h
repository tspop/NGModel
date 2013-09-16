//
//  NGModel+Helpers.h
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import <NGModel.h>
#import "NSObject+Properties.h"

@interface NGModel(Helpers)
- (NSArray *)allProperties;
+ (NSArray *)allProperties;
@end

@interface NSString(Helpers)
- (NSString *)capitalizedFirstLetter;
+ (NSString *)randomStringOfLength:(int)length;
@end

@interface NSDictionary (Utils)
- (NSMutableDictionary *)merge:(NSDictionary *)dict;
@end
