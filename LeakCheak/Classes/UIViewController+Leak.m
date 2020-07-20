//
//  UIViewController+Leak.m
//  HACustomer
//
//  Created by 夏成龙 on 2020/7/16.
//  Copyright © 2020年 夏成龙. All rights reserved.
//

#import "UIViewController+Leak.h"
#import "NSObject+Leak.h"
#import <objc/runtime.h>

@implementation UIViewController (Leak)

+ (void)load {
    [self swizzingMethod:@selector(viewWillAppear:) newSEL:@selector(leak_viewWillAppear:)];
    [self swizzingMethod:@selector(viewDidDisappear:) newSEL:@selector(leak_viewDidDisappear:)];
}

- (void)leak_viewDidDisappear:(BOOL)animated {
    if ([objc_getAssociatedObject(self, "popFlag") boolValue]) {
        [self willDealloc];
    }
    [self leak_viewDidDisappear:animated];
}

- (void)leak_viewWillAppear:(BOOL)animated {
    [self leak_viewWillAppear:animated];
    objc_setAssociatedObject(self, "popFlag", @(NO), OBJC_ASSOCIATION_ASSIGN);
}

@end
