//
//  PopAlertView.h
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/16.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PopAlertViewDelegate  <NSObject>

- (void)cancelPopAlertView;

@end

@interface PopAlertView : UIView

@property (nonatomic,strong)UIView * operateView;

@property (nonatomic,strong)UIButton * cancelBtn;

@property (nonatomic,weak)id<PopAlertViewDelegate>cancelDelegate;
@end
