//
//  EmptyClass.m
//  RuntimeTest
//
//  Created by imaginedays on 2018/10/9.
//  Copyright © 2018年 imaginedays. All rights reserved.
//

#import "EmptyClass.h"
#import <objc/runtime.h>

@implementation EmptyClass

void sayHello(id self, SEL _cmd) {
    NSLog(@"Hello");
}

- (void)addMethod {
    class_addMethod([EmptyClass class], @selector(sayHello2), (IMP)sayHello, "v@:");
}

@end
