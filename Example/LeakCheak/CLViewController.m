//
//  CLViewController.m
//  LeakCheak
//
//  Created by xiacl on 07/20/2020.
//  Copyright (c) 2020 xiacl. All rights reserved.
//

#import "CLViewController.h"
#import <LeakCheak/PodTest.h>

@interface CLViewController ()

@end

@implementation CLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [[[PodTest alloc] init] test];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
