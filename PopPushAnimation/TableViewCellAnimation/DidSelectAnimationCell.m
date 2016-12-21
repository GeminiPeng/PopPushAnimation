//
//  DidSelectAnimationCell.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/21.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import "DidSelectAnimationCell.h"

@interface DidSelectAnimationCell ()

@property (nonatomic,strong)UIImageView * iconView;
@property (nonatomic,strong)UIView * lineView;
@property (nonatomic,strong)UIView * rectView;

@end

@implementation DidSelectAnimationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon"]];
        _iconView.frame = CGRectMake(TRANS_W(260), TRANS_H(20), TRANS_W(40), TRANS_W(40));
        _iconView.alpha = 0.f;
    }
    return _iconView;
}

- (UIView *)lineView {
    if (_lineView == nil) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(TRANS_W(30), TRANS_H(70), 0, 2)];
        _lineView.alpha = 0.f;
    }
    return _lineView;
}

- (UIView *)rectView {
    if (_rectView == nil) {
        _rectView = [[UIView alloc]initWithFrame:CGRectMake(TRANS_W(262), TRANS_H(23), TRANS_W(35), TRANS_W(35))];
        _rectView.layer.borderColor = [UIColor grayColor].CGColor;
        _rectView.layer.borderWidth = 1.0f;
    }
    return _rectView;
}

- (UILabel *)name {
    if (_name == nil) {
        _name = [[UILabel alloc]initWithFrame:CGRectMake(TRANS_W(30), TRANS_H(10), TRANS_W(300), TRANS_H(60))];
        _name.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:30];
        _name.textColor = [UIColor grayColor];
    }
    return _name;
}

- (void)setSubView {
    
    [self addSubview:self.name];
    [self addSubview:self.rectView];
    [self addSubview:self.lineView];
    [self addSubview:self.iconView];
    
}
@end
