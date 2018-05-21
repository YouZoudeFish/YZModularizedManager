//
//  ViewController.m
//  YZProtocolManager
//
//  Created by zhangmin on 2018/5/4.
//  Copyright © 2018年 zhangmin. All rights reserved.
//

#import "ViewController.h"
#import "YZModularizedManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)testFunc:(id)sender {
    Class sec = [YZModularizedManager serviceClassOfProtocol:@protocol(YZGoodsDetailServiceProtocol)];
    __weak typeof(self) weakSelf = self;
    if (sec) {
        UIViewController<YZGoodsDetailServiceProtocol> *vc = [[sec alloc] initWithTitle:@"测试" success:^(NSString *infomations) {
            weakSelf.testLabel.text = infomations;
        }];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
