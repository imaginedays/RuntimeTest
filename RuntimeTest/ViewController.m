//
//  ViewController.m
//  RuntimeTest
//
//  Created by imaginedays on 2018/3/8.
//  Copyright © 2018年 imaginedays. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "person+PersonCategory.h"
#import "EmptyClass.h"
#import "FatherClass.h"
#import "SonClass.h"
#import "person.h"
#import "Animal+Eat.h"

static void *EOCMyAlertViewKey = "EOCMyAlertViewKey";

@interface ViewController ()<UIAlertViewDelegate>

@end

@implementation ViewController
{
    person *per;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    per  = [[person alloc]init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//获取person所有的成员变量
- (IBAction)getAllVariable:(UIButton *)sender {
    unsigned int count = 0;
    Ivar *allVariables = class_copyIvarList([person class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = allVariables[i];
        const char *Variablename = ivar_getName(ivar);
        const char *VariableType = ivar_getTypeEncoding(ivar);
        NSLog(@"(Name: %s) -----(Type:%s)",Variablename,VariableType);
    }
}

- (IBAction)getAllMethod:(UIButton *)sender {
    unsigned int count;
    Method *allMethods = class_copyMethodList([person class], &count);
    for (int i = 0; i < count; i++) {
        Method md = allMethods[i];
        SEL sel = method_getName(md);
        const char *methodname = sel_getName(sel);
        NSLog(@"(Method:%s)",methodname);
    }
}

- (IBAction)changeVariable:(UIButton *)sender {
    NSLog(@"改变前的persion:%@",per);
    unsigned int count = 0;
    Ivar *allList = class_copyIvarList([person class], &count);
    Ivar ivv = allList[0];
    object_setIvar(per, ivv, @"Mike");
    NSLog(@"改变之后的person：%@",per);
}

- (IBAction)addMethod:(UIButton *)sender {
    class_addMethod([person class], @selector(NewMethod), (IMP)myAddingFunction, 0);
    [per performSelector:@selector(NewMethod)];
}

int myAddingFunction(id self, SEL _cmd)
{
    NSLog(@"已新增方法：newMethod");
    return 1;
}

- (IBAction)replaceMethod:(UIButton *)sender {
    
    Method method1 = class_getInstanceMethod([person class], @selector(func1));
    Method method2 = class_getInstanceMethod([person class], @selector(func2));
    
    method_exchangeImplementations(method1, method2);
    [per func1];
    
}

- (IBAction)addVariable:(UIButton *)sender {
    per.height = 12;
    NSLog(@"%f",[per height]);
}

- (IBAction)NullSafe:(UIButton *)sender {
//    id obj = nil;
//    NSMutableDictionary *mDic = [NSMutableDictionary dictionary];
//    [mDic setObject:obj forKey:@"666"];
    
//    EmptyClass *instance = [[EmptyClass alloc]init];
//    [instance performSelector:@selector(sayHello2)];
    
//    FatherClass *f = [[FatherClass alloc]initFatherWithName:@"papa"];
//    SonClass *s = [SonClass new];
//    person *p = [person new];
//
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    [dic setObject:@"1" forKey:@"a"];
//    [dic setObject:nil forKey:@"b"];
    
//    NSMutableString *mutableStr = [NSMutableString stringWithFormat:@"mutableStr"];
//    NSString *copyStr = [mutableStr copy];
//    NSLog(@"%@,%p",mutableStr,mutableStr);
//    NSLog(@"%@,%p",copyStr,copyStr);
//    [mutableStr appendString:@"hahaha"];
//    NSLog(@"%@,%p",mutableStr,mutableStr);
//    NSLog(@"%@,%p",copyStr,copyStr);
    
//    NSArray *array = [NSArray arrayWithObjects:[NSMutableString stringWithString:@"first"],@"b",@"c",nil];
//    NSArray *deepCopyArray=[[NSArray alloc] initWithArray: array copyItems: YES];
//    NSArray* trueDeepCopyArray = [NSKeyedUnarchiver unarchiveObjectWithData:
//                                  [NSKeyedArchiver archivedDataWithRootObject: array]];
//
//    NSLog(@"array------------------------------");
//    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//         NSLog(@"%@,%p",obj,obj);
//    }];
//
//    NSLog(@"deepCopyArray------------------------------");
//    [deepCopyArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"%@,%p",obj,obj);
//    }];
//
//    NSLog(@"trueDeepCopyArray------------------------------");
//    [trueDeepCopyArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"%@,%p",obj,obj);
//    }];
//
//    NSLog(@"point------------------------------");
//    NSLog(@"array = [%p]",array);
//    NSLog(@"deepCopyArray = [%p]",deepCopyArray);
//    NSLog(@"trueDeepCopyArray = [%p]",trueDeepCopyArray);
    
//    [self askUserAQuestion];
//    [self respondsToSelector:@selector(helloword)];
    
    Animal *a = [Animal new];
//    [a shout];
    [a rt_eat];
}

//- (void)askUserAQuestion {
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Question" message:@"What do you want to do?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
//
//    void (^block)(NSInteger) = ^(NSInteger buttonIndex) {
//        if (buttonIndex == 0) {
//            [self doCancel];
//        }else {
//            [self doContinue];
//        }
//    };
//
//    objc_setAssociatedObject(alert, EOCMyAlertViewKey, block, OBJC_ASSOCIATION_COPY);
//    [alert show];
//}
//
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    void(^block)(NSInteger) = objc_getAssociatedObject(alertView, EOCMyAlertViewKey);
//    block(buttonIndex);
//}
//
//- (void)doCancel {
//    NSLog(@"doCancel");
//}
//
//- (void)doContinue {
//    NSLog(@"doContinue");
//}

void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@"dynamicMethodIMP");
}

#pragma mark 运行时第一步，询问当前接收者 处理sel
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(helloword)) {
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    return NO;
}

#pragma mark 第二步 能不能把这条消息给其他接收者来处理。
- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector");
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation");
}



@end
