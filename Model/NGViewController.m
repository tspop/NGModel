//
//  NGViewController.m
//  Model
//
//  Created by Silviu Pop on 8/22/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGViewController.h"
#import "Student.h"
#import "SerializationObject.h"
#import "Human.h"

@interface NGViewController ()

@end

@implementation NGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Human *object = [Human randomInstance];
    NSLog(@"%@",object);
//    NSMutableDictionary *humanDictionary = [object serialize];
    
//    [humanDictionary removeObjectForKey:@"id"];
    
//    NSLog(@"%@",[Human createFromDictionary:humanDictionary]);
}

@end
