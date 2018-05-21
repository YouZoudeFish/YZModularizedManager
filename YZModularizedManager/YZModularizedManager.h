//
//  YZModularizedManager.h
//  YZProtocolManager
//
//  Created by zhangmin on 2018/5/4.
//  Copyright © 2018年 zhangmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@interface YZModularizedManager : NSObject

+ (void)registerServiceClass:(Class)aClass forProtocol:(Protocol *)protocol;
+ (Class)serviceClassOfProtocol:(Protocol *)protocol;

+ (instancetype)new     NS_UNAVAILABLE;
- (instancetype)init    NS_UNAVAILABLE;

@end
NS_ASSUME_NONNULL_END
