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
        
    NSArray *arr = @[@"insurable",@"grapiest",@"nonclassicality",@"obstruct",@"loneliest",@"untearable",@"adequateness",@"nondependency",@"apologetical",@"shortcut",@"counterboring",@"conductible",@"despotically",@"sublittoral",@"neil",@"countersalient",@"unpalatable",@"calefactive",@"canarese",@"rcs",@"ridiculousness",@"nonnephritic",@"piggeries",@"caning",@"unpendulous",@"montcalm",@"consolidating",@"diazotizability",@"correctitude",@"volcanise",@"granulomatosis",@"berserk",@"influent",@"builded",@"telencephalon",@"paniculately",@"droughtiness",@"galvanoplastically",@"alphabetising",@"ephebeion",@"swordfish",@"togliatti",@"pododynia",@"tucana",@"resilient",@"emulsoid",@"outfeeding",@"fervidity",@"minutia",@"rosewood"];
    
    if ([property.typeClass isSubclassOfClass:NSString.class]) {
        [property setValue:arr[rand() % 50] forObject:model];
        return;
    }
    if ([property.typeClass isSubclassOfClass:NSNumber.class]) {
        [property setValue:@(rand() % 256) forObject:model];
        return;
    }
    if ([property.typeClass isSubclassOfClass:NSArray.class]) {
        
        NSString *className = [[property.name substringToIndex:property.name.length - 1] capitalizedString];
        
        Class objectClass = NSClassFromString(className);
        
        NSMutableArray *value = [NSMutableArray array];
        for (int i = 0; i < 5 + rand() % 10; ++i) {
            if (objectClass == nil) {
                [value addObject:arr[rand() % 50]];
            } else {
                [value addObject:[objectClass randomInstance]];
            }

        }
        [property setValue:value forObject:model];
        return;
    }
    
    if ([property.typeClass isSubclassOfClass:NGModel.class]) {
        [property setValue:[property.typeClass randomInstance] forObject:model];
        return;
    }
    
    if ([property.typeClass isSubclassOfClass:NSDate.class]) {
        return;
    }
    
    if ([property.typeClass isSubclassOfClass:NSURL.class]) {
        return;
    }
    
    if (!property.isClass) {
        [property setValue:@(rand() % 256) forObject:model];
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
