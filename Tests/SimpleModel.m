//
//  SimpleModel.m
//  Model
//
//  Created by Silviu Pop on 9/16/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "SimpleModel.h"

@implementation SimpleModel

- (void)setCustomSetterString:(NSString *)customSetterString {
    _customSetterString = [customSetterString stringByAppendingFormat:@"CUSTOMIZED"];
}

@end
