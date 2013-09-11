//
//  NGDataGenerator.h
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NGDataGenerator : NSObject

@property (strong, nonatomic) NSString *property;

+ (instancetype)createWithProperty:(NSString *)property;

- (void)setRandomDataOnObject:(NSObject *)object;

@end
