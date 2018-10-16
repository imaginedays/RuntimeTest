//
//  FatherClass.m
//  RuntimeTest
//
//  Created by imaginedays on 2018/10/9.
//  Copyright © 2018年 imaginedays. All rights reserved.
//

#import "FatherClass.h"

@implementation FatherClass
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;

-(instancetype)initFatherWithName:(NSString *)name {
    self = [super init];
    if (self) {
    }
    return self;
}

+(void)load {
//    NSLog(@"FatherClass load");
}

-(NSString *)getMyFirstName {
    return _firstName;
}

+(void)initialize {
    if (self == [FatherClass self]) {
//      NSLog(@"FatherClass initialize");
    }
}

@end
