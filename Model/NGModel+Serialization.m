//
//  NGModel+Serialization.m
//  Model
//
//  Created by Silviu Pop on 9/3/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel+Serialization.h"

@implementation NGModel(Serialization)

- (id)serialize {
    return [self serializeAsDictionary];
}

- (id)serializeAsDictionary {

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
