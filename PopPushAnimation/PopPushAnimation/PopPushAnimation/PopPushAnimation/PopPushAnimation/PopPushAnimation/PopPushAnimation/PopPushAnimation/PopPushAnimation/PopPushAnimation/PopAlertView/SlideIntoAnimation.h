//
//  SlideIntoAnimation.h
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/16.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SlideIntoAnimation : NSObject

/**
 进入

 @param view 进入的view
 */
- (void)inToAnimation:(UIView *)view;

/**
 退出

 @param view 退出的view
 */
- (void)outAnimation:(UIView *)view;


/**
 弹动

 @param aView 弹动的view
 */
- (void)shakeToShow:(UIView *)aView;

@end
