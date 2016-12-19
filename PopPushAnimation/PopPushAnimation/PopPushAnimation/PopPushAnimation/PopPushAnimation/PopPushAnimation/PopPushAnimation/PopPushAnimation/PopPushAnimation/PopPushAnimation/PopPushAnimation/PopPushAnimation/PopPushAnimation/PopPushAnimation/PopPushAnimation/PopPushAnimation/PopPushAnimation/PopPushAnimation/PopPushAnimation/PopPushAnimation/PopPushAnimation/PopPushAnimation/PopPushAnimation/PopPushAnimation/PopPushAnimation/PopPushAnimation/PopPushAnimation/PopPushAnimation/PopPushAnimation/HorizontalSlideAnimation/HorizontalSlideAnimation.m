//
//  HorizontalSlideAnimation.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/15.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#import "HorizontalSlideAnimation.h"
#import "POP.h"

@interface HorizontalSlideAnimation ()

@property (nonatomic)UIView *fromView,*toView;

@end

@implementation HorizontalSlideAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.5f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    _fromView = fromVC.view;
    _toView = toVC.view;
    _fromView.userInteractionEnabled = _toView.userInteractionEnabled = NO;
    
    [self animate:transitionContext];
}
-(void)animate:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *containerView = [transitionContext containerView];
    if (_show) {
        [containerView addSubview:_toView];
        
        POPLayerSetTranslationX(_toView.layer,SCREEN_WIDTH);
        
        POPSpringAnimation *animation2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationX];
        animation2.springBounciness = 5;
        animation2.springSpeed = 10;
        animation2.dynamicsTension = 299.5;
        animation2.dynamicsFriction = 27.05;
        animation2.toValue = @(0);
        animation2.completionBlock  =^(POPAnimation *anime,BOOL finished){
            _toView.userInteractionEnabled = YES;
            _fromView = nil;
            _toView = nil;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        };
        [_toView.layer pop_addAnimation:animation2 forKey:@"TranslationX"];
        
        
    }else{
        [containerView addSubview:_toView];
        [containerView bringSubviewToFront:_fromView];
        
        POPSpringAnimation *animation2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationX];
        animation2.springBounciness = 5;
        animation2.springSpeed = 10;
        animation2.dynamicsTension = 299.5;
        animation2.dynamicsFriction = 27.05;
        animation2.toValue = @(SCREEN_WIDTH);
        animation2.completionBlock  =^(POPAnimation *anime,BOOL finished){
            [_fromView removeFromSuperview];
            _toView.userInteractionEnabled = YES;
            _fromView = nil;
            _toView = nil;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        };
        [_fromView.layer pop_addAnimation:animation2 forKey:@"TranslationX1"];
    }
}

@end
