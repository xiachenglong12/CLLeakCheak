//
//  UINavigationController+Leak.m
//  HACustomer
//
//  Created by 夏成龙 on 2020/7/16.
//  Copyright © 2020年 夏成龙. All rights reserved.
//

#import "UINavigationController+Leak.h"
#import "NSObject+Leak.h"
#import <objc/runtime.h>

@implementation UINavigationController (Leak)

+ (void)load {
    [self swizzingMethod:@selector(popViewControllerAnimated:) newSEL:@selector(leak_popViewControllerAnimated:)];
}

- (UIViewController *)leak_popViewControllerAnimated:(BOOL)animated {
    UIViewController *vc = [self leak_popViewControllerAnimated:animated];
    objc_setAssociatedObject(vc, "popFlag", @(YES), OBJC_ASSOCIATION_ASSIGN);
    return vc;
}

@end
