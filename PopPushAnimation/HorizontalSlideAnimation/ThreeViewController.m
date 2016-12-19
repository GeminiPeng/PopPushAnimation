//
//  ThreeViewController.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/15.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import "ThreeViewController.h"
#import "WaggleViewController.h"
@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(20, 50, 100, 50);
    back.backgroundColor = [UIColor blueColor];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    UIButton * next = [UIButton buttonWithType:UIButtonTypeCustom];
    [next setTitle:@"下一页" forState:UIControlStateNormal];
    [next setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    next.frame = CGRectMake(220, 150, 100, 50);
    next.backgroundColor = [UIColor greenColor];
    [next addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
}

- (void)back {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)next {
    WaggleViewController * waggleVC = [WaggleViewController new];
    
    [self presentViewController:waggleVC animated:YES completion:nil];
}
@end
