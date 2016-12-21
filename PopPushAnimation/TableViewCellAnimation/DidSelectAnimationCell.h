//
//  DidSelectAnimationCell.h
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/21.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DidSelectAnimationCell : UITableViewCell

@property (nonatomic,strong)UILabel * name;

- (void)showIconAnimation:(BOOL)animation;
- (void)hideIconAnimation:(BOOL)animation;

- (void)showSelectedAnimation;
@end
