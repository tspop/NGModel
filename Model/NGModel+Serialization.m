//
//  NGModel+Serialization.m
//  Model
//
//  Created by Silviu Pop on 9/3/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel+Serialization.h"
#import "NGModel+Helpers.h"

typedef BOOL (^NGPropertyAppearanceBlock)(NSString *propertyName);

@implementation NGModel(Serialization)

+ (NSArray *)splitPropertiesFromString:(NSString *)propertyList {
    NSArray *splitPropertyList = [propertyList componentsSeparatedByString:@","];

    return splitPropertyList;
}

+ (NGPropertyAppearanceBlock)onlyAppearanceBlockForList:(NSString *)propertyList {
    NSArray *splitList = [self splitPropertiesFromString:propertyList];

    return (NGPropertyAppearanceBlock)(^BOOL(NSString *propertyName) {
        return [splitList containsObject:propertyName];
    });
}

+ (NGPropertyAppearanceBlock)exceptAppearanceBlockForList:(NSString *)propertyList {
    NSArray *splitList = [self splitPropertiesFromString:propertyList];
    
    return (NGPropertyAppearanceBlock)(^BOOL(NSString *propertyName) {
        return ![splitList containsObject:propertyName];
    });
}

- (id)serialize {
    return [self serializeUsingPropertyAppearanceBlock:nil];
}

- (id)serializeOnly:(NSString *)onlyList {
    return [self serializeUsingPropertyAppearanceBlock:[self.class onlyAppearanceBlockForList:onlyList]];
}

- (id)serializeExcept:(NSString *)exceptList {
    return [self serializeUsingPropertyAppearanceBlock:[self.class exceptAppearanceBlockForList:exceptList]];
}

- (id)serializeUsingPropertyAppearanceBlock:(NGPropertyAppearanceBlock)appearanceBlock {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    for (NGProperty *property in self.allProperties) {
        
        if (appearanceBlock && appearanceBlock(property.name) == NO) {
            continue;
        }
        
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
    return [self create:data withAppearanceBlock:nil];
}

+ (id)create:(id)data only:(NSString *)onlyList {
    return [self create:data withAppearanceBlock:[self onlyAppearanceBlockForList:onlyList]];
}

+ (id)create:(id)data except:(NSString *)exceptList {
    return [self create:data withAppearanceBlock:[self onlyAppearanceBlockForList:exceptList]];
}

+ (id)create:(id)data withAppearanceBlock:(NGPropertyAppearanceBlock)appearanceBlock {
    NGModel *object = [self new];
    
    for (NGProperty *property in self.allProperties) {
        if (appearanceBlock && appearanceBlock(property.name) == NO) {
            continue;
        }
        
        id value = data[property.name];
        
        if (value == nil) {
            continue;
        }
        
        if (value == [NSNull null]) {
            value = nil;
        } else if ([value isKindOfClass:NSDictionary.class]) {
            // OBJECT
            value = [property.typeClass create:value];
        } else if ([value isKindOfClass:NSArray.class]) {
            // ARRAY
            
            if ([value count] > 0 && [value[0] isKindOfClass:NSDictionary.class]) {
                Class objectClass = NSClassFromString([property.name substringToIndex:property.name.length - 1]);
                NSMutableArray *array = [NSMutableArray arrayWithCapacity:[value count]];
                for (int i = 0; i < [value count]; ++i) {
                    array[i] = [objectClass create:value[i]];
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
