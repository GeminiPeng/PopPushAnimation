//
//  DownBackAnimation.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/14.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import "DownBackAnimation.h"

@implementation DownBackAnimation
{
    UIViewController *_ctrl;
    BOOL shouldCompete;
}

- (void)PanGestureRecognizer:(UIViewController *)ctrl {
    _ctrl = ctrl;
    UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePopRecognizer:)];
    [_ctrl.view addGestureRecognizer:popRecognizer];
}
- (void)handlePopRecognizer:(UIPanGestureRecognizer*)recognizer {

    self.interactive = YES;
    CGPoint translation = [recognizer translationInView:recognizer.view.superview];
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            [_ctrl dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case UIGestureRecognizerStateChanged:
            
        {
            CGFloat fraction = translation.y / recognizer.view.superview.frame.size.height * 0.8;
            fraction = fminf(fmax(fraction, 0.0), 1.0);
            shouldCompete = (fraction>0.35);
            
            [self updateInteractiveTransition:fraction];
        }

            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled: {
            
            _ctrl.view.userInteractionEnabled = NO;
            if (!shouldCompete || recognizer.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
                _ctrl = nil;
            }
        }
        default:
            break;
    }
}
@end
