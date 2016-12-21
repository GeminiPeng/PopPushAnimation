//
//  ViewController.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/9.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import "ViewController.h"
#import "PopCollectionViewCell.h"
#import "PBViewController.h"
#import "PopRecersalAnimation.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIViewControllerTransitioningDelegate>

@property (nonatomic,strong)UICollectionView * collectionView;

@property (nonatomic,strong)PopRecersalAnimation * animation;

@property (nonatomic)BOOL isOne;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _isOne = YES;
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.collectionView];
    
    _animation = [PopRecersalAnimation new];
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
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
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
    
    _animation.modalA = true;
    
    PopCollectionViewCell * view = (PopCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    _animation.frontView = view;
    
//    CGPoint point = [view convertPoint:view.frame.origin fromView:self.view];
    
    CGRect frame = [view convertRect:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height) toView:self.view];
    
    _animation.frontFrame = frame;
    
    PBViewController * pbVC = [PBViewController new];
    pbVC.transitioningDelegate = self;
    [self presentViewController:pbVC animated:YES completion:nil];
    
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


#pragma mark- 

-(id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    
    self.animation.show = true;
    return self.animation;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    
    self.animation.show = false;
    return self.animation;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return nil;
}



@end
