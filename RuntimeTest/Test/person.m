//
//  person.m
//  RuntimeTest
//
//  Created by imaginedays on 2018/3/8.
//  Copyright © 2018年 imaginedays. All rights reserved.
//

#import "person.h"

@implementation person

//@dynamic name;

-(instancetype)init {
    self = [super init];
    if (self)
    {
        self.name = @"imaginedays";
        self.age = 12;
    }
    
    return self;
}

-(void)func1 {
//    NSLog(@"执行func1方法");
}

-(void)func2 {
//     NSLog(@"执行func2方法");
}

-(NSString *)description {
    return [NSString stringWithFormat:@"name:%@ age:%d",self.name,self.age];
}

@end
