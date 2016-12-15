//
//  ShowAnimation.h
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/14.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DownBackAnimation.h"

@interface ShowAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic)DownBackAnimation * downBack;
@property (nonatomic)BOOL show;

@end
