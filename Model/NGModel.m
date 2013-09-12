//
//  NGModel.m
//  Model
//
//  Created by Silviu Pop on 8/22/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel.h"
#import "NSObject+Properties.h"

@implementation NGModel

- (NSString *)className {
    return NSStringFromClass(self.class);
}

+ (NSString *)className {
    return NSStringFromClass(self);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%p: %@",self,[self serialize]];
}

+ (NSString *)pluralizedName {
    return [NSStringFromClass(self) stringByAppendingString:@"s"];
}

- (NSUInteger)hash {
    NSUInteger result = 0;
    for (NGProperty *property in self.properties) {
        result ^= [[property valueOnObject:self] hash];
    }
    return result;
}

- (BOOL)isEqual:(id)object {
    if ([object class] != self.class) {
        return NO;
    }
    for (NGProperty *property in self.properties) {
        if (![[property valueOnObject:self] isEqual:[property valueOnObject:object]]) {
            return NO;
        }
    }
    return YES;
}

@end
