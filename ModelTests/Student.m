//
//  Student.m
//  Model
//
//  Created by Silviu Pop on 9/10/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "Student.h"

@implementation Student

- (id)init
{
    self = [super init];
    if (self) {
        [self setValue:[NSNumber numberWithInt:3232] forKey:@"integer"];
    }
    return self;
}

@end
