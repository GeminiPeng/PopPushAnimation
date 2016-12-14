//
//  PopCollectionViewCell.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/9.
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

#import "PopCollectionViewCell.h"
#import "Masonry.h"


@interface PopCollectionViewCell()

@property(nonatomic,strong)UIImageView *coverImageView;
@property(nonatomic,strong)UILabel *sourceTitleLabel;
@property(nonatomic,strong)UILabel *nameAndTitleLabel;
@property(nonatomic,strong)UILabel *countOfSubscriptionLabel;

@end

@implementation PopCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
    
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.coverImageView = [[UIImageView alloc] init];
    self.coverImageView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.coverImageView];
    CGFloat h = TRANS_H(280);
    CGFloat w = 146 * h / 280;
    CGFloat imageW = ((130 * TRANS_H(173)) / 173.0);
    CGFloat lrMargin = (w - imageW) / 2.0;
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(8);
        make.left.equalTo(self.contentView.mas_left).offset(lrMargin);
        make.right.equalTo(self.contentView.mas_right).offset(-lrMargin);
        make.height.equalTo(@(TRANS_H(173)));
    }];
    
    self.sourceTitleLabel = [self createLabel];
    self.sourceTitleLabel.text = @"嘿嘿";
    self.sourceTitleLabel.font = [UIFont systemFontOfSize:12];
    self.sourceTitleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.sourceTitleLabel];
    [self.sourceTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverImageView.mas_left);
        make.right.equalTo(self.coverImageView.mas_right);
        make.top.equalTo(self.coverImageView.mas_bottom).offset(30);
    }];
    
    self.nameAndTitleLabel = [self createLabel];
    self.nameAndTitleLabel.text = @"嘿嘿";
    [self.contentView addSubview:self.nameAndTitleLabel];
    [self.nameAndTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sourceTitleLabel.mas_bottom).offset(5);
        make.left.equalTo(self.sourceTitleLabel.mas_left);
        make.right.equalTo(self.sourceTitleLabel.mas_right);
    }];
    
    self.countOfSubscriptionLabel = [self createLabel];
    self.countOfSubscriptionLabel.text = @"订阅";
    [self.contentView addSubview:self.countOfSubscriptionLabel];
    [self.countOfSubscriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameAndTitleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.nameAndTitleLabel.mas_left);
        make.right.equalTo(self.nameAndTitleLabel.mas_right);
    }];
    
}

- (UILabel *)createLabel {
    UILabel *la = [[UILabel alloc] init];
    la.textAlignment = NSTextAlignmentLeft;
    la.numberOfLines = 1;
    la.textColor = [UIColor grayColor];
    la.font = [UIFont systemFontOfSize:10];
    return la;
}



@end
