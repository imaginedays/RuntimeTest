//
//  FatherClass.m
//  RuntimeTest
//
//  Created by imaginedays on 2018/10/9.
//  Copyright © 2018年 imaginedays. All rights reserved.
//

#import "FatherClass.h"

@implementation FatherClass

+(void)load {
    NSLog(@"FatherClass load");
}

+(void)initialize {
    if (self == [FatherClass self]) {
      NSLog(@"FatherClass initialize");
    }
}

@end
