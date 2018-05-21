//
//  SecViewController.m
//  YZProtocolManager
//
//  Created by zhangmin on 2018/5/4.
//  Copyright © 2018年 zhangmin. All rights reserved.
//

#import "SecViewController.h"
#import "YZModularizedManager.h"

@interface SecViewController ()<YZGoodsDetailServiceProtocol>

@end

@implementation SecViewController
{
    YZGoodsDetailServiceProtocolSuccessHandler _successHandler;
}
+ (void)load{
    [YZModularizedManager registerServiceClass:[self class] forProtocol:@protocol(YZGoodsDetailServiceProtocol)];
}

- (instancetype)initWithTitle:(NSString *)title success:(YZGoodsDetailServiceProtocolSuccessHandler)success{
    self = [super init];
    if (self) {
        self.navigationItem.title = title;
        if (success) _successHandler = [success copy];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 300, 100);
    [btn setTitle:@"操作,例如:购买" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick {
    [self doSomeOtherOperation];
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    if (_successHandler) _successHandler(@"一些业务类的操作后，需要返回的数据或结果，例如：商品购买成功，取决于协议中定义的参数，或者说调用方需要回传的数据类型");
}

- (void)doSomeOtherOperation {
    /*这里可以做一些别的事情，只是写一个例子*/
    NSLog(@"一些操作，例如：购买");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
