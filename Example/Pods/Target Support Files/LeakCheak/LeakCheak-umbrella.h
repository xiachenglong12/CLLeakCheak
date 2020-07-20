#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSObject+Leak.h"
#import "UINavigationController+Leak.h"
#import "UIViewController+Leak.h"

FOUNDATION_EXPORT double LeakCheakVersionNumber;
FOUNDATION_EXPORT const unsigned char LeakCheakVersionString[];

