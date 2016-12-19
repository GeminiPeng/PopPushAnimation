//
//  PopAlertView.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/16.
//  Copyright © 2016年 Pengbo. All rights reserved.
//
/**宽度比例缩放*/
#define TRANS_W(w) (w/375.0)*SCREEN_WIDTH

/**高度比例缩放*/
#define TRANS_H(h) (h/667.0)*SCREEN_HEIGHT

/**屏幕宽度*/
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

/**屏幕高度*/
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#import "PopAlertView.h"
#import "Masonry.h"

@implementation PopAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithRed:77.0/255.0 green:77.0/255.0 blue:77.0/255.0 alpha:0.5];
        
        [self addSubview:self.operateView];
        
        [self.operateView addSubview:self.cancelBtn];
        [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.operateView);
            make.size.mas_equalTo(CGSizeMake(TRANS_W(100), TRANS_H(50)));
        }];
    }
    return self;
}

- (UIView *)operateView {
    if (_operateView == nil) {
        
        _operateView = [[UIView alloc]initWithFrame:CGRectMake(20,TRANS_W(236) , TRANS_W(335), TRANS_H(200))];
        _operateView.backgroundColor = [UIColor whiteColor];
        _operateView.layer.cornerRadius= 4;
        _operateView.clipsToBounds = YES;
        CGRect oldFrame = _operateView.frame;
        _operateView.layer.anchorPoint = CGPointMake(0, 0);
        _operateView.frame = oldFrame;
    }
    return _operateView;
}

- (UIButton *)cancelBtn {
    
    if (_cancelBtn == nil) {
        
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelBtn setBackgroundColor:[UIColor blackColor]];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

- (void)cancelClick {
    
    if ([self.cancelDelegate respondsToSelector:@selector(cancelPopAlertView)]) {
        [self.cancelDelegate cancelPopAlertView];
    }
}

@end
