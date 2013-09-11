//
//  NGProperty.m
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGProperty.h"

@implementation NGProperty

+ (NGProperty *)createWithObjCProperty:(objc_property_t)property {
    NGProperty *result = [NGProperty new];
    
    result.name = [NSString stringWithUTF8String: property_getName(property)];
    
    NSArray *attrPairs = [[NSString stringWithUTF8String: property_getAttributes(property)] componentsSeparatedByString: @","];
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] initWithCapacity:[attrPairs count]];
    for(NSString *attrPair in attrPairs) {
        [attributes setObject:[attrPair substringFromIndex:1] forKey:[attrPair substringToIndex:1]];
    }
    
    NSString *type = attributes[@"T"];
    if ([type characterAtIndex:0] == '@') {
        // Class Type
        result.type = [type substringWithRange:NSMakeRange(2, type.length - 3)];

    } else {
        result.type = type;
    }
        
    return result;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@",self.type,self.name];
}

@end
