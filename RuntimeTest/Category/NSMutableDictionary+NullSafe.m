//
//  NSMutableDictionary+NullSafe.m
//  RuntimeTest
//
//  Created by imaginedays on 2018/10/9.
//  Copyright © 2018年 imaginedays. All rights reserved.
//

#import "NSMutableDictionary+NullSafe.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (NullSafe)

- (void)swizzeMethod:(SEL)orignalSelector withMethod:(SEL)newSelector {
    Class class = [self class];
    //原始方法
    Method orignalMethod = class_getInstanceMethod(class, orignalSelector);
    //交换方法
    Method swizzeldMethod = class_getInstanceMethod(class, newSelector);
    
    //如果添加覆盖父类实现的方法，如果该类中有相同的方法则添加不成功，需要使用method_setImplementation
    /*
     class_addMethod will add an override of a superclass's implementation, but will not replace an existing implementation in this class. To change an existing implementation, use method_setImplementation.
     */
    BOOL isAddMethodSuccess = class_addMethod(class, orignalSelector, method_getImplementation(swizzeldMethod), method_getTypeEncoding(swizzeldMethod));
    
    if (isAddMethodSuccess) {
        //添加成功，将新sel的imp用orignal替换
        class_replaceMethod(class, newSelector,method_getImplementation(orignalMethod), method_getTypeEncoding(orignalMethod));
    }else {
        // 交换方法实现
        method_exchangeImplementations(orignalMethod, swizzeldMethod);
    }
}

+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        id obj = [[self alloc]init];
//        [obj swizzeMethod:@selector(setObject:forKey:) withMethod:@selector(safe_setObject:forKey:)];
//        [obj swizzeMethod:@selector(removeObjectForKey:) withMethod:@selector(safe_removeObjectForKey:)];
//    });
}

- (void)safe_setObject:(id)value forKey:(NSString *)key {
    if (value) {
        [self safe_setObject:value forKey:key];
    }else {
//        NSLog(@"[NSMutableDictionary setObject: forkey:%@]不能为空;",key);
    }
}

- (void)safe_removeObjectForKey:(NSString *)key {
    if ([self objectForKey:key]) {
        [self safe_removeObjectForKey:key];
    }else {
//        NSLog(@"[NSMutableDictionary setObject: forKey:%@]值不能为空;",key);
    }
}

@end
