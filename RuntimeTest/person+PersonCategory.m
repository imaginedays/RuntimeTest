//
//  person+PersonCategory.m
//  RuntimeTest
//
//  Created by imaginedays on 2018/3/8.
//  Copyright © 2018年 imaginedays. All rights reserved.
//

#import "person+PersonCategory.h"
#import <objc/runtime.h>

const char *str = "myKey";

@implementation person (PersonCategory)


-(void)setHeight:(float)height
{
    NSNumber *num = [NSNumber numberWithFloat:height];
    
    objc_setAssociatedObject(self, str, num, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(float)height
{
    NSNumber *number = objc_getAssociatedObject(self, str);
    return [number floatValue];
}

@end
