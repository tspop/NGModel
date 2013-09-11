//
//  NGModel+Serialization.m
//  Model
//
//  Created by Silviu Pop on 9/3/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel+Serialization.h"
#import "NSObject+Properties.h"

@implementation NGModel(Serialization)

- (id)serialize {
    return [self serializeAsDictionary];
}

- (id)serializeAsDictionary {
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    for (NGProperty *property in self.properties) {
        if (![property isClass]) {
            continue;
        }
        id value;
        if (property.typeClass == NSDictionary.class) {
            
        } else if (property.typeClass == NSArray.class) {
            value = [property valueOnObject:self];
        } else {
            value = [property valueOnObject:self];
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

}

+ (void)setDateFormatter:(NSDateFormatter *)dateFormatter forProperty:(NSString *)property {
    static NSMutableDictionary *dateFormatters;
    if (dateFormatters == nil) {
        dateFormatters = [NSMutableDictionary new];
    }
    if (dateFormatters[self.className] == nil) {
        dateFormatters[self.className] = [NSMutableDictionary new];
    }
    dateFormatters[self.className][property] = dateFormatter;
}

@end
