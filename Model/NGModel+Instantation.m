//
//  NGModel+Instantation.m
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel+Instantation.h"
#import "NGModel+Helpers.h"
#import "NGDataGenerator.h"

@implementation NGModel(Instantation)

+ (int)recursionDepth {
    return 0;
}

+ (BOOL)stackExceedRecursionLimit:(NSArray *)stack {
    int numberOfAppearances = 0;
    for (Class class in stack) {
        if ([self.class isSubclassOfClass:class]) {
            numberOfAppearances++;
        }
        if (numberOfAppearances > [self recursionDepth]) {
            return YES;
        }
    }
    return NO;
}

+ (void)generateProperty:(NGProperty *)property forModel:(NGModel *)model withStack:(NSMutableArray *)stack {
    
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
                if ([objectClass stackExceedRecursionLimit:stack]) {
                    return;
                }
                
                NGModel *model = [objectClass randomInstanceWithStack:stack];
                if (model == nil) {
                    return;
                }
                [value addObject:model];
            }

        }
        [property setValue:value forObject:model];
        return;
    }
    
    if ([property.typeClass isSubclassOfClass:NGModel.class]) {
        if ([property.typeClass stackExceedRecursionLimit:stack]) {
            return;
        }
        
        [property setValue:[property.typeClass randomInstanceWithStack:stack] forObject:model];
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

+ (instancetype)randomInstanceWithStack:(NSMutableArray *)stack {
    [stack addObject:self.class];
        
    NGModel *result = [self new];
    
    for (NGProperty *property in self.allProperties) {
        NGDataGenerator *generator;
        if (generator == nil) {
            [self generateProperty:property forModel:result withStack:stack];
        } else {
            [generator setRandomDataOnObject:result];
        }
    }
    [stack removeLastObject];
    return result;
}

+ (instancetype)randomInstance {
    return [self randomInstanceWithStack:[NSMutableArray array]];
}

@end
