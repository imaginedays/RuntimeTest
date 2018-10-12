//
//  FatherClass+AgeL.m
//  RuntimeTest
//
//  Created by imaginedays on 2018/10/9.
//  Copyright © 2018年 imaginedays. All rights reserved.
//

#import "FatherClass+AgeL.h"

@implementation FatherClass (AgeL)

+(void)load {
//    NSLog(@"FatherClass AgeL load");
}

+(void)initialize {
    if (self == [FatherClass self]) {
//        NSLog(@"FatherClass AgeL initialize");
    }
}

@end
