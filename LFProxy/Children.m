//
//  Children.m
//  LFProxy
//
//  Created by Feng Luo on 2020/3/28.
//  Copyright © 2020 Feng Luo. All rights reserved.
//

#import "Children.h"

#import "Man.h"
#import "Women.h"
#import <objc/runtime.h>

@interface Children ()

@property (nonatomic, strong) NSMutableDictionary *methodsMap;

@end

@implementation Children

+(instancetype)shareProxy {
    return [[self alloc] init];
}

- (instancetype)init
{
    _methodsMap = [NSMutableDictionary dictionary];
    [self registerMethodsWithTarget:[Man new]];
    [self registerMethodsWithTarget:[Women new]];
    return self;
}

- (void)registerMethodsWithTarget:(id)target {
    unsigned int count = 0;
    Method *method_list = class_copyMethodList([target class], &count);
    for (int i = 0; i < count; i++) {
        Method method = method_list[i];
        SEL sel = method_getName(method);
        [_methodsMap setObject:target forKey:NSStringFromSelector(sel)];
    }
    free(method_list);
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    
    id target  = _methodsMap[NSStringFromSelector(sel)];
    if (target && [target respondsToSelector:sel]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    } else {
        return [super methodSignatureForSelector:sel];
    }
    
}


- (void)forwardInvocation:(NSInvocation *)invocation {
    
    id target = _methodsMap[NSStringFromSelector(invocation.selector)];
    if (target && [target respondsToSelector:invocation.selector]) {
        [invocation invokeWithTarget:target];
    } else {
        [super forwardInvocation:invocation];
    }
    
}

@end
