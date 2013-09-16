//
//  Splunge.m
//  Model
//
//  Created by Silviu Pop on 9/16/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "Splunge.h"

@implementation Splunge

+ (void)initMappings {
    [self mapClassToValue:UIColor.class withRule:^id(UIColor *value) {
        float r,g,b,a;
        [value getRed:&r green:&g blue:&b alpha:&a];
        return [NSString stringWithFormat:@"%.1f %.1f %.1f",r,g,b];
    }];
}

@end
