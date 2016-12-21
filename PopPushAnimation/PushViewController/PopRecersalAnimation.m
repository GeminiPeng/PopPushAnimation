//
//  PopRecersalAnimation.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/14.
//  Copyright © 2016年 Pengbo. All rights reserved.
//



#import "PopRecersalAnimation.h"


@interface PopRecersalAnimation ()
@property (nonatomic)UIView * fromView, *toView;
@property (nonatomic)CGRect assist_frame;
@property (nonatomic)CGFloat pa1;
@property (nonatomic)UIView *bgView;
@property (nonatomic)UIView *superView;

@end

@implementation PopRecersalAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    _fromView = fromVC.view;
    _toView = toVC.view;
    _fromView.userInteractionEnabled = _toView.userInteractionEnabled = NO;
    
    // 3. Add toVC's view to containerView
    if (self.modalA) {
        [self animateB:transitionContext];
    }
    else
    {
        [self animateA:transitionContext];
    }
}

-(void)animateA:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    
    if (_show) {
        [containerView addSubview:_toView];
        POPLayerSetTranslationX(_toView.layer, _toView.frame.size.width);
        
        POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        animation.springBounciness = 5;
        animation.springSpeed = 10;
        animation.dynamicsTension = 299.5;
        animation.dynamicsFriction = 27.05;
        animation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.9f, 0.9f)];
        [_fromView.layer pop_addAnimation:animation forKey:@"scaleAnim"];
        
        POPSpringAnimation *animation3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        animation3.springBounciness = 0;
        animation3.springSpeed = 5;
        animation3.toValue = @(0);
        [_fromView.layer pop_addAnimation:animation3 forKey:@"opacityAnim"];
        
        POPSpringAnimation *animation2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationX];
        animation2.springBounciness = 0;
        animation2.springSpeed = 20;
        animation2.toValue = @(0);
        animation2.completionBlock  =^(POPAnimation *anime,BOOL finished){
            _toView.userInteractionEnabled = YES;
            [_fromView removeFromSuperview];
            _fromView = nil;
            _toView = nil;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        };
        [_toView.layer pop_addAnimation:animation2 forKey:@"scaleAnim2"];
        
        
    }
    else
    {
        [containerView addSubview:_toView];
        [containerView sendSubviewToBack:_toView];
        
        POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        animation.springBounciness = 5;
        animation.springSpeed = 10;
        animation.dynamicsTension = 299.5;
        animation.dynamicsFriction = 27.05;
        animation.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
        [_toView.layer pop_addAnimation:animation forKey:@"scaleAnim"];
        
        POPSpringAnimation *animation3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        animation3.springBounciness = 0;
        animation3.springSpeed = 5;
        animation3.toValue = @(1);
        [_toView.layer pop_addAnimation:animation3 forKey:@"opacityAnim"];
        
        POPSpringAnimation *animation2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerTranslationX];
        animation2.springBounciness = 0;
        animation2.springSpeed = 20;
        animation2.toValue =[NSNumber numberWithFloat:_fromView.frame.size.width];
        animation2.completionBlock  =^(POPAnimation *anime,BOOL finished){
            [_fromView removeFromSuperview];
            _toView.userInteractionEnabled = YES;
            _fromView = nil;
            _toView = nil;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        };
        
        [_fromView.layer pop_addAnimation:animation2 forKey:@"scaleAnim2"];
    }
}

-(void)animateB:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    
    if (_show) {
        _frontView.superview.userInteractionEnabled=NO;
        _frontView.userInteractionEnabled=NO;
        [_fromView addSubview:_toView];
        _assist_frame = _frontView.frame;
        _superView = _frontView.superview;
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _bgView = [[UIView alloc]init];
        CGPoint  ap = CGPointMake(anchorPoint(CGRectGetMinX(_frontFrame),CGRectGetWidth(_frontFrame),SCREEN_WIDTH), anchorPoint(CGRectGetMinY(_frontFrame),CGRectGetHeight(_frontFrame),SCREEN_HEIGHT));
        _bgView.layer.anchorPoint = ap;
        _bgView.frame = frame;
        [_fromView addSubview:_bgView];
        [_bgView addSubview:_toView];
        [_bgView addSubview:_frontView];
        
        _frontView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        
        CGFloat p1 = CGRectGetWidth(_frontFrame)/SCREEN_WIDTH;
        CGFloat p2 = CGRectGetHeight(_frontFrame)/SCREEN_HEIGHT;
        
        POPLayerSetScaleXY(_bgView.layer, CGPointMake(p1, p2));
        
        [containerView addSubview:_bgView];
        
        
        [self setPa1:0];
        _frontView.layer.doubleSided = _toView.layer.doubleSided = NO;
        POPSpringAnimation *animation = [_fromView.layer pop_animationForKey:@"scaleAnim"];
        if (!animation) {
            animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        }
        animation.springBounciness = 5;
        animation.springSpeed = 10;
        animation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.9f, 0.9f)];
        [_fromView.layer pop_addAnimation:animation forKey:@"scaleAnim"];
        
        POPSpringAnimation *animation3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        animation3.springBounciness = 0;
        animation3.springSpeed = 5;
        animation3.toValue = @(0);
        [_fromView.layer pop_addAnimation:animation3 forKey:@"opacityAnim"];
        
        POPSpringAnimation *animation2 = [_bgView.layer pop_animationForKey:@"scaleAnim2"];
        if (!animation2) {
            animation2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        }
        animation2.springBounciness = 0;
        animation2.springSpeed = 20;
        animation2.toValue = [NSValue valueWithCGSize:CGSizeMake(1.0f, 1.0f)];
        [_bgView.layer pop_addAnimation:animation2 forKey:@"scaleAnim2"];
        
        POPSpringAnimation *animation4 = [self pop_animationForKey:@"flipAnim"];
        
        if (!animation4) {
            animation4 = [POPSpringAnimation animation];
            animation4.springBounciness = 0;
            animation4.springSpeed = 5;
            animation4.property = [POPAnimatableProperty propertyWithName:@"popAnimationProgress" initializer:^(POPMutableAnimatableProperty *prop) {
                prop.readBlock = ^(PopRecersalAnimation *obj, CGFloat values[]) {
                    values[0] = obj.pa1;
                };
                prop.writeBlock = ^(PopRecersalAnimation *obj, const CGFloat values[]) {
                    obj.pa1 = values[0];
                };
                prop.threshold = 0.001;
            }];
            
            [self pop_addAnimation:animation4 forKey:@"flipAnim"];
        }
        animation4.completionBlock  =^(POPAnimation *anime,BOOL finished){
            
            [_bgView removeFromSuperview];
            [_frontView removeFromSuperview];
            [containerView addSubview:_toView];
            _bgView = nil;
            _toView.userInteractionEnabled = YES;
            [_fromView removeFromSuperview];
            _fromView = nil;
            _toView = nil;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        };
        animation4.toValue = @(1.0);
        
    }
    else
    {
        [containerView addSubview:_toView];
        _bgView = [[UIView alloc]init];
        CGPoint ap = CGPointMake(anchorPoint(CGRectGetMinX(_frontFrame),CGRectGetWidth(_frontFrame),SCREEN_WIDTH), anchorPoint(CGRectGetMinY(_frontFrame),CGRectGetHeight(_frontFrame),SCREEN_HEIGHT));
        _bgView.layer.anchorPoint = ap;
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _bgView.frame = frame;
        [_bgView addSubview:_frontView];
        
        [_bgView addSubview:_fromView];
        [self setPa1:1];
        [containerView addSubview:_bgView];
        
        POPSpringAnimation *animation = [_toView.layer pop_animationForKey:@"scaleAnim"];
        if (!animation) {
            animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        }
        animation.springBounciness = 5;
        animation.springSpeed = 10;
        animation.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
        [_toView.layer pop_addAnimation:animation forKey:@"scaleAnim"];
        
        POPSpringAnimation *animation3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        animation3.springBounciness = 0;
        animation3.springSpeed = 5;
        animation3.toValue = @(1);
        [_toView.layer pop_addAnimation:animation3 forKey:@"opacityAnim"];
        
        POPSpringAnimation *animation2 = [_bgView.layer pop_animationForKey:@"scaleAnim2"];
        if (!animation2) {
            animation2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        }
        animation2.springBounciness = 0;
        animation2.springSpeed = 20;
        animation2.toValue = [NSValue valueWithCGSize:CGSizeMake(CGRectGetWidth(_frontFrame)/SCREEN_WIDTH, CGRectGetHeight(_frontFrame)/SCREEN_HEIGHT)];
        [_bgView.layer pop_addAnimation:animation2 forKey:@"scaleAnim2"];
        
        
        POPSpringAnimation *animation4 = [self pop_animationForKey:@"flipAnim"];
        
        if (!animation4) {
            animation4 = [POPSpringAnimation animation];
            animation4.springBounciness = 0;
            animation4.springSpeed = 5;
            animation4.property = [POPAnimatableProperty propertyWithName:@"popAnimationProgress" initializer:^(POPMutableAnimatableProperty *prop) {
                prop.readBlock = ^(PopRecersalAnimation *obj, CGFloat values[]) {
                    values[0] = obj.pa1;
                };
                prop.writeBlock = ^(PopRecersalAnimation *obj, const CGFloat values[]) {
                    obj.pa1 = values[0];
                };
                prop.threshold = 0.001;
            }];
            
            [self pop_addAnimation:animation4 forKey:@"flipAnim"];
        }
        animation4.completionBlock  =^(POPAnimation *anime,BOOL finished){
            POPLayerSetScaleXY(_frontView.layer, CGPointMake(1, 1));
            [_bgView removeFromSuperview];
            _frontView.frame = _assist_frame;
            [_superView addSubview:_frontView];
            _superView.userInteractionEnabled=YES;
            _frontView.userInteractionEnabled=YES;
            [_fromView removeFromSuperview];
            _bgView = nil;
            _toView.userInteractionEnabled = YES;
            _frontView = nil;
            _fromView = nil;
            _toView = nil;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        };
        animation4.toValue = @(0);
    }
}
-(void)setPa1:(CGFloat)pa1
{
    _pa1 = pa1;
    CGFloat r = POPTransition(pa1,0,M_PI);
    //    CATransform3D transloate0 = CATransform3DMakeTranslation(0, 0, 0);
    CATransform3D rotate0 = CATransform3DMakeRotation(r, 0, 1, 0);
    CATransform3D scale0 = CATransform3DMakeScale(SCREEN_WIDTH/CGRectGetWidth(_frontFrame), SCREEN_HEIGHT/CGRectGetHeight(_frontFrame), 1);
    CATransform3D mat0 = CATransform3DConcat(rotate0, scale0);
    _frontView.layer.transform = CATransform3DPerspect(mat0, CGPointMake(0, 0), 500);
    
    CGFloat r2 = POPTransition(pa1,M_PI,0);
    CATransform3D transloate1 = CATransform3DMakeTranslation(0, 0, 0);
    CATransform3D rotate1 = CATransform3DMakeRotation(r2, 0, 1, 0);
    CATransform3D mat1 = CATransform3DConcat(rotate1, transloate1);
    if (_show) {
        _toView.layer.transform = CATransform3DPerspect(mat1, CGPointMake(0, 0), -500);
    }
    else
    {
        _fromView.layer.transform = CATransform3DPerspect(mat1, CGPointMake(0, 0), -500);
    }
    
}

CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ)
{
    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
    CATransform3D scale = CATransform3DIdentity;
    scale.m34 = -1.0f/disZ;
    return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
}

CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ)
{
    return CATransform3DConcat(t, CATransform3DMakePerspective(center, disZ));
}

CGFloat anchorPoint(CGFloat x,CGFloat a,CGFloat b){
    return x/(b-a);
}

static inline CGFloat POPTransition(CGFloat progress, CGFloat startValue, CGFloat endValue) {
    return startValue + (progress * (endValue - startValue));
}
@end
