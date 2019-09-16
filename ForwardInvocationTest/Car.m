//
//  Car.m
//  ForwardInvocationTest
//
//  Created by 刘艳芹 on 2019/5/24.
//  Copyright © 2019 刘艳芹. All rights reserved.
//

#import "Car.h"
#import <objc/runtime.h>
#import "Person.h"
#import <objc/message.h>

@implementation Car

//- (void)runTo:(NSString *)place{
//    NSLog(@"car runTo %@",place);
//}




#pragma mark -- Method one
//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel == @selector(runTo:)) {
//        class_addMethod(self, sel, (IMP)dynamicMethodIMPRunTo, "v@:@");
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}
//
////动态添加的@selector(runTo:) 对应的实现
//static void dynamicMethodIMPRunTo(id self, SEL _cmd,id place){
//    NSLog(@"dynamicMethodIMPRunTo %@",place);
//}



#pragma mark -- Method two
//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    //将消息转发给Person的实例
//    if (aSelector == @selector(runTo:)){
//        return [[Person alloc]init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}



#pragma mark -- Method three
+ (void)load{
    SEL selector = @selector(runTo:);
    Method targetMethod = class_getInstanceMethod(self.class, @selector(selector));
    const char *typeEncoding = method_getTypeEncoding(targetMethod);
    IMP targetMethodIMP = _objc_msgForward;
    class_replaceMethod(self.class, selector, targetMethodIMP, typeEncoding);
}

//消息转发，调用这个方法。anInvocation中保存着调用方法时传递的参数信息
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    if (anInvocation.selector == @selector(runTo:)){
        NSLog(@"%s",__func__);
    }else{
        
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    //判断selector是否为需要转发的，如果是则手动生成方法签名并返回。
    if (aSelector == @selector(runTo:)){
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    return [super forwardingTargetForSelector:aSelector];
}



@end
