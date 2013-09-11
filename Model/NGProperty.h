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

+ (NGProperty *)createWithObjCProperty:(objc_property_t)property;

@end
