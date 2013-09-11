//
//  NGProperty.h
//  Model
//
//  Created by Silviu Pop on 9/11/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NGProperty : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) Class typeClass;

+ (NGProperty *)createWithObjCProperty:(objc_property_t)property;
- (id)valueOnObject:(NSObject *)object;
- (void)setValue:(id)newValue forObject:(NSObject *)object;
- (BOOL)isClass;

@end
