//
//  MetaSplunge.m
//  Model
//
//  Created by Silviu Pop on 9/16/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "MetaSplunge.h"

@implementation MetaSplunge

+ (void)initMappings {
    [super initMappings];
    [self mapClassToValue:UIView.class withRule:^id(id value) {
        return NSStringFromCGRect([value frame]);
    }];
}

@end
