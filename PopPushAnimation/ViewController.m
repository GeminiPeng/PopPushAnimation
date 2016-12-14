//
//  ViewController.m
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

#import "ViewController.h"
#import "PopCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView * collectionView;

@property (nonatomic)BOOL isOne;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (UICollectionView *)collectionView {
    
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(TRANS_W(146), TRANS_H(280));
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        // 设置最小行间距，也就是前一行与后一行的中间最小间隔
        flowLayout.minimumLineSpacing = 0;
        // 设置最小列间距，也就是左行与右一行的中间最小间隔
        flowLayout.minimumInteritemSpacing = 0;
        // 内边距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, TRANS_W(8), 0, TRANS_W(8));
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, TRANS_H(230), SCREEN_WIDTH, TRANS_H(280)) collectionViewLayout:flowLayout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[PopCollectionViewCell class] forCellWithReuseIdentifier:@"popCell"];
    }
    return _collectionView;
}



#pragma mark - collectionViewDelegate & dataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    PopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"popCell" forIndexPath:indexPath];
    
    return  cell;
    
    
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_isOne) {
        
        if (indexPath.row < 3) {
            
            cell.transform = CGAffineTransformTranslate(cell.transform, 0, TRANS_H(472));
            
            [UIView animateWithDuration:0.7 delay:0.12 * indexPath.row usingSpringWithDamping:0.8 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
                
                cell.transform = CGAffineTransformIdentity;
                
                
            } completion:^(BOOL finished) {
                
                
            }];
        }
    }
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    _isOne = NO;
    
}


@end
