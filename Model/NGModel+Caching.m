//
//  NGModel+Caching.m
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel+Caching.h"

@implementation NGModel_Caching

+ (NSMutableDictionary *)dictionaryFromCache:(NGCache)cache {
    switch (cache) {
        case kNGCacheDateFormatters:
            
            break;
        case kNGCacheProperties:
            break;
    }
}

+ (void)cacheValue:(id)value forClass:(Class)class inCache:(NGCache)cache {
    
}

+ (void)cacheValue:(id)value forProperty:(NSString *)property onClass:(Class)class inCache:(NGCache)cache {
    NSMutableDictionary *dictionary = [self dictionaryFromCache:cache];
}

@end
