//
//  NGModel+Helpers.m
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel+Helpers.h"
#import "NGModel.h"

@implementation NSDictionary (Utils)

- (NSMutableDictionary *)merge:(NSDictionary *)dict {
    @try {
        NSMutableDictionary *result = nil;
        if ([self isKindOfClass:[NSMutableDictionary class]]) {
            result = (NSMutableDictionary *)self;
        } else {
            result = [NSMutableDictionary dictionaryWithDictionary:self];
        }
        
        for (id key in dict) {
            if (result[key] == nil) {
                result[key] = dict[key];
            } else {
                if ([result[key] isKindOfClass:[NSDictionary class]] &&
                    [dict[key] isKindOfClass:[NSDictionary class]]) {
                    result[key] = [result[key] merge:dict[key]];
                } else {
                    result[key] = dict[key];
                }
            }
        }
        return result;
        
    }
    @catch (NSException *exception) {
        return [self mutableCopy];
    }
}

@end

@implementation NGModel(Helpers)

- (NSArray *)allProperties {
    return [self.class allProperties];
}

+ (NSArray *)allProperties {
    NSMutableArray *result = (NSMutableArray *)[self properties];
    
    Class parentClass = self.superclass;
    
    while (parentClass != NGModel.class) {
        [result addObjectsFromArray:[parentClass properties]];
        parentClass = parentClass.superclass;
    }
    
    return result;
}

@end

@implementation NSString(Helpers)

- (NSString *)capitalizedFirstLetter {
    return [self stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                      withString:[[self  substringToIndex:1] capitalizedString]];
}


+ (NSString *)randomStringOfLength:(int)length {
    static NSString *letters;
    if (letters == nil) {
        letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    }
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: length];
    
    for (int i=0; i<length; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    
    return randomString;
}

@end
