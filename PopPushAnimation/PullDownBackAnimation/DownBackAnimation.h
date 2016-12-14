//
//  DownBackAnimation.h
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/14.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownBackAnimation : UIPercentDrivenInteractiveTransition

@property (nonatomic)BOOL interactive;

- (void)PanGestureRecognizer:(UIViewController *)ctrl;
@end
