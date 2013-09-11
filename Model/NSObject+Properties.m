//
//  NSObject+Properties.m
//  Model
//
//  Created by Silviu Pop on 9/10/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NSObject+Properties.h"
#import <objc/runtime.h>
#import "NGProperty.h"

@implementation NSObject(Properties)

- (NSArray *)properties {
    unsigned int count;
    objc_property_t *list = class_copyPropertyList(self.class, &count);
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];
    for(unsigned i = 0; i < count; i++)
        array[i] = [NGProperty createWithObjCProperty:list[i]];
    
    free(list);
    
    return array;
}

@end
