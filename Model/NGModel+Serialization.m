//
//  NGModel+Serialization.m
//  Model
//
//  Created by Silviu Pop on 9/3/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel+Serialization.h"
#import "NSObject+Properties.h"

@interface NSObject(PrimitiveClasses)
- (BOOL)isPrimitiveClass;
@end

@implementation NSObject(PrimitiveClasses)


- (BOOL)isPrimitiveClass {
    static NSArray *primitiveClasses;
    if (primitiveClasses == nil) {
        primitiveClasses = @[NSString.class,NSNumber.class,NSNull.class];
    }
    for (Class class in primitiveClasses) {
        if ([self isKindOfClass:class]) {
            return YES;
        }
    }
    return NO;
}

@end

@implementation NGModel(Serialization)

- (id)serialize {
    return [self serializeAsDictionary];
}

- (id)serializeAsDictionary {
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    for (NGProperty *property in self.properties) {
        id value = [property valueOnObject:self];
        
        if ([property.typeClass isSubclassOfClass:NGModel.class]) {
            //OBJECT
        } else if ([property.typeClass isSubclassOfClass:NSArray.class]) {
            //ARRAY
            if ([value count] > 0 && [value[0] isKindOfClass:NGModel.class]) {
                
            }
        }
        
        if (value != nil) {
            result[property.name] = value;
        } else {
            result[property.name] = [NSNull null];
        }

    }
    return result;
}

+ (id)create:(id)data {
    return [self createFromDictionary:data];
}

+ (id)createFromDictionary:(NSDictionary *)dictionary {
    NGModel *object = [self new];
    
    for (NGProperty *property in self.properties) {
        
        id value = dictionary[property.name];
        
        if (value == nil) {
            continue;
        }
        
        if (value == [NSNull null]) {
            value = nil;
        } else if ([value isKindOfClass:NSDictionary.class]) {
            // OBJECT
            value = [property.typeClass createFromDictionary:value];
        } else if ([value isKindOfClass:NSArray.class]) {
            // ARRAY
            
            if ([value count] > 0 && [value[0] isKindOfClass:NSDictionary.class]) {
                Class objectClass = NSClassFromString([property.name substringToIndex:property.name.length - 1]);
                NSMutableArray *array = [NSMutableArray arrayWithCapacity:[value count]];
                for (int i = 0; i < [value count]; ++i) {
                    array[i] = [objectClass createFromDictionary:value[i]];
                }
                value = array;
            }
        }
        
        if ([property.typeClass isSubclassOfClass:NSDate.class]) {
            value = [[self dateFormatterForProperty:property.name] dateFromString:value];
        }
        if ([property.typeClass isSubclassOfClass:NSURL.class]) {
            value = [NSURL URLWithString:value];
        }
        
        [property setValue:value forObject:object];
    }
    return object;
}

static NSMutableDictionary *dateFormatters;

+ (NSDateFormatter *)dateFormatterForProperty:(NSString *)property {
    return dateFormatters[self.className][property];
}

+ (void)setDateFormatter:(NSDateFormatter *)dateFormatter forProperty:(NSString *)property {

    if (dateFormatters == nil) {
        dateFormatters = [NSMutableDictionary new];
    }
    if (dateFormatters[self.className] == nil) {
        dateFormatters[self.className] = [NSMutableDictionary new];
    }
    dateFormatters[self.className][property] = dateFormatter;
}

@end
