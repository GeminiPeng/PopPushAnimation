//
//  DownBackVC.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/15.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import "DownBackVC.h"
#import "ThreeViewController.h"
#import "HorizontalSlideAnimation.h"
#import "PopAlertView.h"
#import "SlideIntoAnimation.h"


@interface DownBackVC ()<UIViewControllerTransitioningDelegate,PopAlertViewDelegate>

@property (nonatomic,strong)HorizontalSlideAnimation * animation;

@property (nonatomic,strong)PopAlertView * alertView;
@end

@implementation DownBackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _animation = [HorizontalSlideAnimation new];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(20, 50, 100, 50);
    back.backgroundColor = [UIColor blueColor];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    UIButton * alert = [UIButton buttonWithType:UIButtonTypeCustom];
    [alert setTitle:@"提示框" forState:UIControlStateNormal];
    [alert setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    alert.frame = CGRectMake(220, 50, 100, 50);
    alert.backgroundColor = [UIColor redColor];
    [alert addTarget:self action:@selector(alertViewClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:alert];
    
    
    UIButton * next = [UIButton buttonWithType:UIButtonTypeCustom];
    [next setTitle:@"下一页" forState:UIControlStateNormal];
    [next setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    next.frame = CGRectMake(220, 150, 100, 50);
    next.backgroundColor = [UIColor greenColor];
    [next addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];

}

- (PopAlertView *)alertView {
    
    if (_alertView == nil) {
        
        _alertView = [[PopAlertView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _alertView.cancelDelegate = self;
    }
    return _alertView;
}

- (void)next {
    ThreeViewController * threeVC = [ThreeViewController new];
    threeVC.transitioningDelegate = self;
    [self presentViewController:threeVC animated:YES completion:nil];
}

- (void)alertViewClick {
    
    SlideIntoAnimation * animation = [[SlideIntoAnimation alloc]init];
    [animation inToAnimation:self.alertView.operateView];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.alertView];
}

- (void)cancelPopAlertView {
    
    SlideIntoAnimation * animation = [[SlideIntoAnimation alloc]init];
    [animation outAnimation:self.alertView.operateView];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.alertView.alpha = 0.0;
    }completion:^(BOOL finished) {
        [self.alertView removeFromSuperview];
        self.alertView = nil;
    }];
    

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
