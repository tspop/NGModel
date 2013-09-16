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

+ (NSArray *)propertiesCached:(BOOL)cached {
    static NSMutableDictionary *propertiesCache;
    if (propertiesCache == nil) {
        propertiesCache = [NSMutableDictionary new];
    }
    if (cached) {
        id cachedProperties = propertiesCache[NSStringFromClass(self)];
        if (cachedProperties) {
            return cachedProperties;
        }
    }
    unsigned int count;
    objc_property_t *list = class_copyPropertyList(self, &count);
    
    NSMutableArray *array = [NSMutableArray array];
    for(unsigned i = 0; i < count; i++) {
        NGProperty *result = [NGProperty createWithObjCProperty:list[i]];
        if (result) {
            [array addObject:result];
        }
    }

    
    free(list);
    
    if (cached) {
        propertiesCache[NSStringFromClass(self)] = array;
    }
    
    return array;
}

+ (NSArray *)properties {
    return [self propertiesCached:YES];
}

- (NSArray *)propertiesCached:(BOOL)cached {
    return [self.class propertiesCached:cached];
}

- (NSArray *)properties {
    return [self.class propertiesCached:YES];
}

@end
