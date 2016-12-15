//
//  ShowAnimation.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/14.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


#import "ShowAnimation.h"
#import "POP.h"

@interface ShowAnimation ()

@property (nonatomic)UIView *fromView,*toView;
@property (nonatomic)CGFloat y;

@end

@implementation ShowAnimation

- (instancetype)init {
    if (self = [super init]) {
        _downBack = [DownBackAnimation new];
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.5;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    _fromView = fromVC.view;
    _toView = toVC.view;
    _fromView.userInteractionEnabled = _toView.userInteractionEnabled = NO;
    
    [self animate:transitionContext];
}

-(void)animate:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView * containerView = [transitionContext containerView];
    
    if (_show) {
        [_downBack PanGestureRecognizer:[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey]];
        [containerView addSubview:_toView];
        POPLayerSetTranslationY(_toView.layer, SCREEN_HEIGHT);
        
        POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        animation.springBounciness = 5;
        animation.springSpeed = 10;
        animation.dynamicsTension = 299.5;
        animation.dynamicsFriction = 27.05;
        animation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.9f, 0.9f)];
        [_fromView.layer pop_addAnimation:animation forKey:@"scaleAnim"];
        
        POPSpringAnimation *animation3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
        animation3.springBounciness = 5;
        animation3.springSpeed = 10;
        animation3.dynamicsTension = 299.5;
        animation3.dynamicsFriction = 27.05;
        animation3.toValue = @(-SCREEN_HEIGHT/2);
        [_fromView.layer pop_addAnimation:animation3 forKey:@"TranslationY"];
        
        POPSpringAnimation *animation4 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        animation4.springBounciness = 5;
        animation4.springSpeed = 10;
        animation4.dynamicsTension = 299.5;
        animation4.dynamicsFriction = 27.05;
        animation4.toValue = @(0.8);
        [_fromView.layer pop_addAnimation:animation4 forKey:@"opacityAnim"];
        
        POPSpringAnimation *animation2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
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
        [_toView.layer pop_addAnimation:animation2 forKey:@"scaleAnim2"];
    }
    
    else if (!_downBack.interactive)
    {
        
        [containerView addSubview:_toView];
        [containerView bringSubviewToFront:_fromView];
        
        POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        animation.springBounciness = 5;
        animation.springSpeed = 10;
        animation.dynamicsTension = 299.5;
        animation.dynamicsFriction = 27.05;
        animation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
        [_toView.layer pop_addAnimation:animation forKey:@"scaleAnim"];
        
        POPSpringAnimation *animation3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
        animation3.springBounciness = 5;
        animation3.springSpeed = 10;
        animation3.dynamicsTension = 299.5;
        animation3.dynamicsFriction = 27.05;
        animation3.toValue = @(0);
        [_toView.layer pop_addAnimation:animation3 forKey:@"TranslationY"];
        
        POPSpringAnimation *animation4 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        animation4.springBounciness = 5;
        animation4.springSpeed = 10;
        animation4.dynamicsTension = 299.5;
        animation4.dynamicsFriction = 27.05;
        animation4.toValue = @(1);
        [_toView.layer pop_addAnimation:animation4 forKey:@"opacityAnim"];
        
        
        POPSpringAnimation *animation2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationY];
        animation2.springBounciness = 5;
        animation2.springSpeed = 10;
        animation2.dynamicsTension = 299.5;
        animation2.dynamicsFriction = 27.05;
        animation2.toValue = @(SCREEN_HEIGHT);
        animation2.completionBlock  =^(POPAnimation *anime,BOOL finished){
            _toView.userInteractionEnabled = YES;
            [_fromView removeFromSuperview];
            _fromView = nil;
            _toView = nil;
            _downBack.interactive=NO;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        };
        [_fromView.layer pop_addAnimation:animation2 forKey:@"scaleAnim2"];
    }
    else{
        [containerView addSubview:_toView];
        [containerView bringSubviewToFront:_fromView];
        self.y = 0;
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^(void){
            self.y = 1;
        }completion:^(BOOL finished){
            if ([transitionContext transitionWasCancelled]) {
                _fromView.userInteractionEnabled = YES;
                _fromView = nil;
                _toView = nil;
            }
            else
            {
                [_fromView removeFromSuperview];
                _toView.userInteractionEnabled = YES;
                _fromView = nil;
                _toView = nil;
            }
            _downBack.interactive=NO;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
        }];
    }
}

-(void)setY:(CGFloat)y
{
    _y = y;
    
    CGFloat scale = POPTransition(y,0.9,1);
    POPLayerSetScaleXY(_toView.layer, CGPointMake(scale, scale));
    
    POPLayerSetTranslationY(_toView.layer, POPTransition(y, -SCREEN_HEIGHT/2, 0));
    
    _toView.layer.opacity = POPTransition(y, 0.8, 1);
    
    POPLayerSetTranslationY(_fromView.layer, POPTransition(y, 0, SCREEN_HEIGHT));
    
}

static inline CGFloat POPTransition(CGFloat progress, CGFloat startValue, CGFloat endValue) {
    return startValue + (progress * (endValue - startValue));
}
@end
