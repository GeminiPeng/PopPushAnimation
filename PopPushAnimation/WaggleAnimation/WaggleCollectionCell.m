//
//  WaggleCollectionCell.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/16.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import "WaggleCollectionCell.h"
#import "Masonry.h"


@interface WaggleCollectionCell ()

@property (nonatomic,strong)UIImageView * articleImage;
@property (nonatomic,strong)UILabel * articleTitleLabel;
@property (nonatomic,strong)UIView *gradientView;
@property (nonatomic,strong)UILabel *masterNameLabel;

@end

@implementation WaggleCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.contentView.layer.shadowColor = [[UIColor colorWithRed:219.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0] CGColor];
        self.contentView.layer.shadowOpacity = 1.0;
        self.contentView.layer.shadowOffset = CGSizeMake(0, 0.5);
        self.contentView.layer.shadowRadius = 0.0;
        self.contentView.layer.cornerRadius = 2.0;
        
        [self configSubviewsLayout];
    }
    return self;
}

- (void)configSubviewsLayout {
    
    [self.contentView addSubview:self.articleImage];
    [self.articleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(20);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
    
    [self.contentView addSubview:self.articleTitleLabel];
    [self.articleTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
    }];
    
    [self.contentView addSubview:self.masterNameLabel];
    [self.masterNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
    }];
}

- (UIImageView *)articleImage {
    if (_articleImage == nil) {
        
        _articleImage = [UIImageView new];
        [_articleImage setBackgroundColor:[UIColor lightGrayColor]];

    }
    return _articleImage;
}

- (UILabel *)articleTitleLabel {
    if (_articleTitleLabel == nil) {
        
        _articleTitleLabel = [UILabel new];
        _articleTitleLabel.text = @"哈哈哈";
        _articleTitleLabel.textColor = [UIColor blueColor];
        _articleTitleLabel.textAlignment = NSTextAlignmentLeft;
        _articleTitleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _articleTitleLabel;
}

- (UILabel *)masterNameLabel {
    if (_masterNameLabel == nil) {
        
        _masterNameLabel = [UILabel new];
        _masterNameLabel.text = @"嘿嘿";
        _masterNameLabel.textColor = [UIColor blackColor];
        _masterNameLabel.textAlignment = NSTextAlignmentLeft;
        _masterNameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _masterNameLabel;
}

@end
