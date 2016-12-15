//
//  DownBackVC.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/15.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import "DownBackVC.h"


@interface DownBackVC ()

@end

@implementation DownBackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(20, 50, 100, 50);
    back.backgroundColor = [UIColor yellowColor];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    UIButton * alert = [UIButton buttonWithType:UIButtonTypeCustom];
    [alert setTitle:@"提示框" forState:UIControlStateNormal];
    [alert setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    alert.frame = CGRectMake(220, 50, 100, 50);
    alert.backgroundColor = [UIColor redColor];
    [alert addTarget:self action:@selector(alertView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:alert];

}

- (void)alertView {
    
}

- (void)back {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
