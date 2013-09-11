//
//  NGModel.m
//  Model
//
//  Created by Silviu Pop on 8/22/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel.h"

@implementation NGModel

- (NSString *)className {
    return NSStringFromClass(self.class);
}

+ (NSString *)className {
    return NSStringFromClass(self);
}

@end
