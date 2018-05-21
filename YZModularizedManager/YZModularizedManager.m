//
//  YZModularizedManager.m
//  YZProtocolManager
//
//  Created by zhangmin on 2018/5/4.
//  Copyright © 2018年 zhangmin. All rights reserved.
//

#import "YZModularizedManager.h"
#import <objc/runtime.h>

#define YZSharedModularizedManager [YZModularizedManager sharedManager]

@implementation YZModularizedManager
{
    NSCache *_serviceProtocolCache;
}

+ (instancetype)sharedManager{
    static YZModularizedManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self->_serviceProtocolCache = [[NSCache alloc] init];
    }
    return self;
}

+ (void)registerServiceClass:(Class)className forProtocol:(Protocol *)protocol
{
    [YZSharedModularizedManager registerServiceClass:className forProtocol:protocol];
}

+ (Class)serviceClassOfProtocol:(Protocol *)protocol{
    return [YZSharedModularizedManager serviceClassOfProtocol:protocol];
}

- (void)registerServiceClass:(Class)className forProtocol:(Protocol *)protocol{
    NSAssert(className != nil, @"class can not be nil!");
    NSAssert(protocol != nil, @"protocol can not be nil!");

    if (![_serviceProtocolCache objectForKey:protocol]) {
        [_serviceProtocolCache setObject:className forKey:protocol];
    }
}

- (Class)serviceClassOfProtocol:(Protocol *)protocol{
    Class aclass = [_serviceProtocolCache objectForKey:protocol];
    if (!aclass) {
        NSLog(@"%@尚未注册服务！",NSStringFromClass(aclass));
    }
    if (![aclass conformsToProtocol:protocol]) {
        NSLog(@"%@尚未遵循%@协议！",NSStringFromClass(aclass),NSStringFromProtocol(protocol));
    }
    return aclass;
//    if(aclass){
//        if(!class_conformsToProtocol(aclass, protocol)){
//            //            // 给aclass添加一个新协议
//            //            Protocol *testP = objc_allocateProtocol("testP");
//            //            protocol_addMethodDescription(testP, NSSelectorFromString(@"testFunc"), method_getTypeEncoding(class_getInstanceMethod([self class], @selector(testFunc))), YES, YES);
//            //            objc_registerProtocol(testP);
//            //            class_addProtocol(aclass, testP);
//            //
//            //            class_addMethod(aclass, @selector(testFunc), class_getMethodImplementation([self class], @selector(testFunc)), method_getTypeEncoding(class_getInstanceMethod([self class], @selector(testFunc))));
//
//            // 给aclass添加protocol协议
//            protocol_addMethodDescription(protocol, NSSelectorFromString(@"testFunc"), method_getTypeEncoding(class_getInstanceMethod([self class], @selector(testFunc))), YES, YES);
//            class_addProtocol(aclass, protocol);
//            class_addMethod(aclass, @selector(testFunc), class_getMethodImplementation([self class], @selector(testFunc)), method_getTypeEncoding(class_getInstanceMethod([self class], @selector(testFunc))));
//        }
//        // aclass类遵循的协议
//        unsigned int count;
//        Protocol *__unsafe_unretained *list = class_copyProtocolList(aclass, &count);
//        for (int i = 0; i < count; i++) {
//            Protocol *pro = list[i];
//            NSLog(@"%@", NSStringFromProtocol(pro));
//        }
//        free(list);
//    }
//    return aclass;
}

- (void)testFunc{
    NSLog(@"%s",__func__);
}

@end
