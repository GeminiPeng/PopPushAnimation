//
//  ThreeViewController.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/15.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import "ThreeViewController.h"

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
}

- (void)back {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
