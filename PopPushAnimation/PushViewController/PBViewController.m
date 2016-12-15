//
//  PBViewController.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/14.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import "PBViewController.h"
#import "DownBackVC.h"
#import "ShowAnimation.h"


@interface PBViewController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic,strong)ShowAnimation * animation;

@end

@implementation PBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _animation = [ShowAnimation new];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(20, 50, 100, 50);
    back.backgroundColor = [UIColor yellowColor];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    UIButton * todown = [UIButton buttonWithType:UIButtonTypeCustom];
    [todown setTitle:@"下一页" forState:UIControlStateNormal];
    [todown setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    todown.frame = CGRectMake(220, 50, 100, 50);
    todown.backgroundColor = [UIColor redColor];
    [todown addTarget:self action:@selector(todown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:todown];
    
}

- (void)todown {
    DownBackVC * downVC = [DownBackVC new];
    downVC.transitioningDelegate = self;
    [self presentViewController:downVC animated:YES completion:nil];
}

- (void)back {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    
    self.animation.show = true;
    return self.animation;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    
    self.animation.show = false;
    return self.animation;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return nil;
}

@end
