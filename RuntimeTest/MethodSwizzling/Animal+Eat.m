//
//  Animal+Eat.m
//  RuntimeTest
//
//  Created by imaginedays on 2018/10/23.
//  Copyright © 2018 imaginedays. All rights reserved.
//

#import "Animal+Eat.h"
#import <objc/runtime.h>

@implementation Animal (Eat)

- (void)rt_eat {
    [self rt_eat];
//    NSLog(@"rt_eat");
}

+ (void)load {
    Method orginalMethod = class_getInstanceMethod([self class], @selector(shout));
    Method swappedMethod = class_getInstanceMethod([self class], @selector(rt_eat));
    method_exchangeImplementations(orginalMethod, swappedMethod);
}

@end
