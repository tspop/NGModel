//
//  NGModel+Helpers.m
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGModel+Helpers.h"

@implementation NSString(Helpers)

- (NSString *)capitalizedFirstLetter {
    return [self stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                      withString:[[self  substringToIndex:1] capitalizedString]];
}


+ (NSString *)randomStringOfLength:(int)length {
    static NSString *letters;
    if (letters == nil) {
        letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    }
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: length];
    
    for (int i=0; i<length; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    
    return randomString;
}

@end
