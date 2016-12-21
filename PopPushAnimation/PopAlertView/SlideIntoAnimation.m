//
//  SlideIntoAnimation.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/16.
//  Copyright © 2016年 Pengbo. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SlideIntoAnimation.h"


@implementation SlideIntoAnimation

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)inToAnimation:(UIView *)view {
    
    [view.layer pop_addAnimation:[self createAlphaAnimationWithFromValue:0.0 toValue:1.0] forKey:@"noEnoughMoneyView.fuckAlphaAnimation.key"];
    
    [view.layer pop_addAnimation:[self createTransitionAnimationWithFromValue:(SCREEN_HEIGHT - 7.0)  toValue:TRANS_H(236.0)] forKey:@"noEnoughMoneyView.fuckTransitionAnimation.key"];
    
    [view.layer pop_addAnimation:[self createRotationAnimationWithFromValue:5.0 toValue:0.0] forKey:@"noEnoughMoneyView.fuckRotationAnimation.key"];
}

- (void)outAnimation:(UIView *)view {
    
    CGRect oldF = view.frame;
    view.layer.anchorPoint = CGPointMake(0, 0);
    view.frame = oldF;
    [view.layer pop_addAnimation:[self createAlphaAnimationWithFromValue:1.0 toValue:0.0] forKey:@"noEnoughMoneyView.dis.fuckAlphaAnimation.key"];
    
    [view.layer pop_addAnimation:[self createTransitionAnimationWithFromValue: TRANS_H(236.0) toValue:(SCREEN_HEIGHT - 7.0)] forKey:@"noEnoughMoneyView.dis.fuckTransitionAnimation.key"];
    
    [view.layer pop_addAnimation:[self createRotationAnimationWithFromValue:0.0 toValue:5.0] forKey:@"noEnoughMoneyView.dis.fuckRotationAnimation.key"];
}

- (POPSpringAnimation *)createAlphaAnimationWithFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue {
    POPSpringAnimation *alphaAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    alphaAnimation.springBounciness = 5;
    alphaAnimation.springSpeed = 10;
    alphaAnimation.fromValue = @(fromValue);
    alphaAnimation.toValue = @(toValue);
    return alphaAnimation;
}

- (POPSpringAnimation *)createTransitionAnimationWithFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue {
    POPSpringAnimation *transitionAnimtion = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    transitionAnimtion.springBounciness = 5;
    transitionAnimtion.springSpeed = 7;
    transitionAnimtion.fromValue = @(fromValue);
    transitionAnimtion.toValue = @(toValue);
    return transitionAnimtion;
}

- (POPSpringAnimation *)createRotationAnimationWithFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue {
    POPSpringAnimation *rotationAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    CGFloat angleS = (1.0 / 180.0) * M_PI;//3
    rotationAnimation.springSpeed = angleS;
    rotationAnimation.springBounciness = 0.0;
    CGFloat angle = (fromValue / 180.0) * M_PI;
    rotationAnimation.fromValue = @(angle);
    CGFloat toAngle = (toValue / 180.0) * M_PI;
    rotationAnimation.toValue = @(toAngle);
    rotationAnimation.dynamicsFriction = 10.0;
    return rotationAnimation;
}


- (void)shakeToShow:(UIView *)aView
{
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.35;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)], [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [aView.layer addAnimation:popAnimation forKey:nil];
}
@end
