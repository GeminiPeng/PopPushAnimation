//
//  PBViewController.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/14.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import "PBViewController.h"


@interface PBViewController ()

@end

@implementation PBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    
    back.frame = CGRectMake(20, 50, 100, 50);
    back.backgroundColor = [UIColor yellowColor];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
}

- (void)back {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
