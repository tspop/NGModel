//
//  NGDataGenerator.m
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGDataGenerator.h"

@implementation NGDataGenerator

+ (instancetype)createWithProperty:(NSString *)property {
    NGDataGenerator *dataGenerator = [NGDataGenerator new];
    dataGenerator.property = property;
    return dataGenerator;
}

- (void)setRandomDataOnObject:(NSObject *)object {
    [object setValue:@"i swear to god this is random" forKey:self.property];
}

@end
