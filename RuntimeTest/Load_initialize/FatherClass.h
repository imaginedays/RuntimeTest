//
//  FatherClass.h
//  RuntimeTest
//
//  Created by imaginedays on 2018/10/9.
//  Copyright © 2018年 imaginedays. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FatherClass : NSObject

@property (nonatomic, copy) NSString *firstName;    //!< 名字
@property (nonatomic, copy) NSString *lastName;    //!< 名字

-(instancetype)initFatherWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
