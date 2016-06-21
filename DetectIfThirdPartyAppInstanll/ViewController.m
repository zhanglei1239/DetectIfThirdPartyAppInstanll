//
//  ViewController.m
//  DetectIfThirdPartyAppInstanll
//
//  Created by user on 16/6/21.
//  Copyright © 2016年 user. All rights reserved.
//

#import "ViewController.h"
#import "Toast+UIView.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.btnDetect = [[UIButton alloc] initWithFrame:CGRectMake(20, 300, ScreenWidth-40, 40)];
    [self.btnDetect setTitle:@"检测是否安装第三方应用" forState:UIControlStateNormal];
    [self.btnDetect addTarget:self action:@selector(detect:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnDetect setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.btnDetect];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)detect:(id)sender{
    BOOL canOpenWechat = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"wechat://"]];
    BOOL canOpenSina = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weibo://"]];
    BOOL canOpenQQ = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]];
    NSString * wc = @"";
    NSString * si = @"";
    NSString * qq = @"";
    if (canOpenQQ) {
        qq = @"安装了qq";
    }else{
        qq = @"未安装qq";
    }
    if (canOpenSina) {
        si = @"安装了微博";
    }else{
        si = @"未安装微博";
    }
    
    if (canOpenWechat) {
        wc = @"安装了微信";
    }else{
        wc = @"未安装微信";
    }
    NSString * result = [NSString stringWithFormat:@"%@,%@,%@",wc,si,qq];
    [self.view makeToast:result duration:1 position:@"center" withTextColor:[UIColor whiteColor] withValue:@""];
}

@end
