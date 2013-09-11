//
//  NGViewController.m
//  Model
//
//  Created by Silviu Pop on 8/22/13.
//  Copyright (c) 2013 Silviu Pop. All rights reserved.
//

#import "NGViewController.h"
#import "Student.h"
#import "NSObject+Properties.h"

@interface NGViewController ()

@end

@implementation NGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    Student *student = [Student new];
    NSLog(@"%@",student.properties);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
