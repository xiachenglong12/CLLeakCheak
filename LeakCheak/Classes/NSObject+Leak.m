//
//  NSObject+Leak.m
//  HACustomer
//
//  Created by 夏成龙 on 2020/7/16.
//  Copyright © 2020年 夏成龙. All rights reserved.
//

#import "NSObject+Leak.h"
#import <objc/runtime.h>

@implementation NSObject (Leak)

+ (void)swizzingMethod:(SEL)oldSEL newSEL:(SEL)newSEL {
    Method oldM = class_getInstanceMethod(self, oldSEL);
    Method newM = class_getInstanceMethod(self, newSEL);
    method_exchangeImplementations(oldM, newM);
}


- (void)willDealloc {
    __weak typeof(self)weakSelf = self;
    
    NSMapTable *mapArr = [NSMapTable weakToWeakObjectsMapTable];
    unsigned int count = 0;
    objc_property_t *propertys = class_copyPropertyList(weakSelf.class, &count);
    for (int i = 0; i < count; i ++) {
        const char *propertyName = property_getName(propertys[i]);
        NSString *propertyNameStr = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        id obj = [weakSelf valueForKey:[NSString stringWithUTF8String:propertyName]];
        [mapArr setObject:obj forKey:propertyNameStr];
    }
    NSString *className = NSStringFromClass(weakSelf.class);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf) {
            NSLog(@"-----没有被释放-----%@", className);
        } else {
             NSLog(@"-----被释放-----%@", className);
        }
        for (id key in mapArr) {
            id obj = [mapArr objectForKey:key];
            if (obj) {
                NSLog(@"-----%@->%@没有释放---%@-----",className, key, obj);
            }
        }
    });
}


@end
