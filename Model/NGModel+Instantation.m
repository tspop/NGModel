//
//  NGModel+Instantation.m
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel+Instantation.h"
#import "NSObject+Properties.h"
#import "NGDataGenerator.h"

@implementation NGModel(Instantation)

+ (void)generateProperty:(NGProperty *)property forModel:(NGModel *)model {
            NSArray *arr = @[@"ala",@"bala",@"portocala"];
    
    if ([property.typeClass isSubclassOfClass:NSString.class]) {
        [property setValue:arr[rand() % 3] forObject:model];
    }
    if ([property.typeClass isSubclassOfClass:NSNumber.class]) {
        [property setValue:@(rand() % 256) forObject:model];
    }
    if ([property.typeClass isSubclassOfClass:NSArray.class]) {
        NSMutableArray *value = [NSMutableArray array];
        for (int i = 0; i < 5 + rand() % 10; ++i) {
            [value addObject:arr[rand() % 3]];
        }
        [property setValue:value forObject:model];
    }
}

+ (instancetype)randomInstance {
    NGModel *result = [self new];
    
    for (NGProperty *property in [self properties]) {
        NGDataGenerator *generator;
        if (generator == nil) {
            [self generateProperty:property forModel:result];
        } else {
            [generator setRandomDataOnObject:result];
        }
    }
    
    return result;
}

@end
