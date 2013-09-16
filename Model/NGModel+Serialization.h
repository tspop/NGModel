//
//  NGModel+Serialization.h
//  Model
//
//  Created by Silviu Pop on 9/3/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel.h"

@interface NGModel(Serialization)

- (id)serialize;
- (id)serializeOnly:(NSString *)onlyList;
- (id)serializeExcept:(NSString *)exceptList;

+ (id)create:(id)data;
+ (id)create:(id)data only:(NSString *)onlyList;
+ (id)create:(id)data except:(NSString *)exceptList;

- (id)update:(id)data;
- (id)update:(id)data only:(NSString *)onlyList;
- (id)update:(id)data except:(NSString *)exceptList;

+ (void)setDateFormatter:(NSDateFormatter *)dateFormatter forProperty:(NSString *)property;
+ (NSDateFormatter *)dateFormatterForProperty:(NSString *)property;


// KEY PROPERTY MAPPING

@property NSValueTransformer *keyPropertyMapper;
+ (void)addMappingForKeysToProperties:(NSDictionary *)mapping;
+ (void)addMappingForKey:(NSString *)key toProperty:(NSString *)property;

// PROPERTY VALUE MAPPING


// CLASS VALUE MAPPING
+ (void)mapClass:(Class)class toString:(NSString *)string;

@end
