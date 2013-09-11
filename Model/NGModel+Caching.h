//
//  NGModel+Caching.h
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel.h"

typedef enum {
    kNGCacheProperties,
    kNGCacheDateFormatters,
    kNGCacheDataGenerators
} NGCache;

@interface NGModel(Caching)

+ (void)cacheValue:(id)value forClass:(Class)class inCache:(NGCache)cache;
+ (void)cacheValue:(id)value forProperty:(NSString *)property onClass:(Class)class inCache:(NGCache)cache;

@end
