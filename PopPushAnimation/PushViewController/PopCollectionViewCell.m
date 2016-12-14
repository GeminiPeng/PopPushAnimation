//
//  PopCollectionViewCell.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/9.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import "PopCollectionViewCell.h"

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
    
//        [self setupViews];
    }
    return self;
}




@end
