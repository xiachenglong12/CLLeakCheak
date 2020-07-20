//
//  NSObject+Leak.h
//  HACustomer
//
//  Created by 夏成龙 on 2020/7/16.
//  Copyright © 2020年 夏成龙. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Leak)

+ (void)swizzingMethod:(SEL)oldSEL newSEL:(SEL)newSEL;
- (void)willDealloc;

@end

NS_ASSUME_NONNULL_END
