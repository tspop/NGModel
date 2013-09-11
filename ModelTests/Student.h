//
//  Student.h
//  Model
//
//  Created by Silviu Pop on 9/10/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

typedef enum {
    someEnumValue
} SomeEnum;

#import "NGModel.h"

@interface Student : NGModel

@property NSString *name;
@property int integer;
@property unsigned int unsignedInteger;
@property BOOL boolean;
@property bool littleBoolean;
@property short shortInteger;
@property unsigned short unsignedShort;
@property char character;
@property unsigned char unsignedCharacter;
@property float floatVariable;
@property double doubleVariable;
@property SomeEnum someEnum;
@property int *intPointer;
@property char *charPointer;
@property unsigned char *unsignedCharPointer;
@property short *shortPointer;
@end
