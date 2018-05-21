//  Created by zhangmin on 2018/5/4.
//  Copyright © 2018年 zhangmin. All rights reserved.

/*
 所有服务模块对外提供的服务都写在这个protocol文件中，对应协议方法在服务模块中去实现
 */
#import <Foundation/Foundation.h>

@protocol YZGoodsDetailServiceProtocol <NSObject>
typedef void(^YZGoodsDetailServiceProtocolSuccessHandler)(NSString *infomations);

- (instancetype)initWithTitle:(NSString *)title
                      success:(YZGoodsDetailServiceProtocolSuccessHandler)success;
@end


//其他模块提供的服务
@protocol YZOtherModularServiceProtocol <NSObject>
// ...提供的服务（即协议方法）
@end

