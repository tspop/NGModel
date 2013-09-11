//
//  NGProperty.m
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGProperty.h"
#import "NGModel+Helpers.h"

@interface NGProperty()
@property SEL setter;
@property SEL getter;
@end

@implementation NGProperty

- (id)initWithObjCProperty:(objc_property_t)property {
    self = [super init];
    
    self.name = [NSString stringWithUTF8String: property_getName(property)];
    
    NSArray *attrPairs = [[NSString stringWithUTF8String: property_getAttributes(property)] componentsSeparatedByString: @","];
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] initWithCapacity:[attrPairs count]];
    for(NSString *attrPair in attrPairs) {
        [attributes setObject:[attrPair substringFromIndex:1] forKey:[attrPair substringToIndex:1]];
    }
    
    NSString *type = attributes[@"T"];
    if ([type characterAtIndex:0] == '@') {
        // Class Type
        self.type = [type substringWithRange:NSMakeRange(2, type.length - 3)];
        self.typeClass = NSClassFromString(self.type);

        NSSelectorFromString(self.name);
        
        self.getter = NSSelectorFromString(self.name);
        
        NSString *setterString = [NSString stringWithFormat:@"set%@:",[self.name capitalizedFirstLetter]];
        
        self.setter = NSSelectorFromString(setterString);
    } else {
        self.type = type;
    }
    
    return self;
}

+ (NGProperty *)createWithObjCProperty:(objc_property_t)property {
    return [[NGProperty alloc] initWithObjCProperty:property];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@",self.type,self.name];
}

- (id)valueOnObject:(NSObject *)object {
    if (self.isClass) {
        return [object performSelector:self.getter];
    } else {
        [object valueForKey:self.name];
    }
}
- (void)setValue:(id)newValue forObject:(NSObject *)object {
    if (self.isClass) {
        [object performSelector:self.setter withObject:newValue];
    } else {
        [object setValue:newValue forKey:self.name];
    }
}

- (BOOL)isClass {
    return self.typeClass != nil;
}

@end
