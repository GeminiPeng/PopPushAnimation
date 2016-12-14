//
//  PopRecersalAnimation.h
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/14.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface PopRecersalAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic,strong)UIView * frontView;
@property (nonatomic)CGRect frontFrame;
@property (nonatomic)BOOL show,modalA;
@end
