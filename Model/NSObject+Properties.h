//
//  NSObject+Properties.h
//  Model
//
//  Created by Silviu Pop on 9/10/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NGProperty.h"

@interface NSObject(Properties)

- (NSArray *)properties;
- (NSArray *)propertiesCached:(BOOL)cached;
+ (NSArray *)properties;
+ (NSArray *)propertiesCached:(BOOL)cached;

@end
