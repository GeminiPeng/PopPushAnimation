//
//  WaggleViewController.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/16.
//  Copyright © 2016年 Pengbo. All rights reserved.
//
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define TRANS_W(w) (w/375.0)*SCREEN_WIDTH
#define TRANS_H(h) (h/667.0)*SCREEN_HEIGHT
#import "WaggleViewController.h"
#import "WaggleFlowLayout.h"
#import "WaggleCollectionCell.h"

@interface WaggleViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView * collectionView;

@end

@implementation WaggleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor redColor];

    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(20, 30, 100, 50);
    back.backgroundColor = [UIColor blueColor];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    [self.view addSubview:self.collectionView];

}

- (void)back {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UICollectionView *)collectionView {
    
    if (_collectionView == nil) {
        
        WaggleFlowLayout * flowLayout = [[WaggleFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, TRANS_H(140));
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        // 设置最小行间距，也就是前一行与后一行的中间最小间隔
        flowLayout.minimumLineSpacing = 18;
        // 设置最小列间距，也就是左行与右一行的中间最小间隔
        flowLayout.minimumInteritemSpacing = 20;
    
        flowLayout.headerReferenceSize=CGSizeMake(10, 20);
        flowLayout.footerReferenceSize=CGSizeMake(10, 20);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, TRANS_H(100), SCREEN_WIDTH, SCREEN_HEIGHT-TRANS_H(100)) collectionViewLayout:flowLayout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor blueColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[WaggleCollectionCell class] forCellWithReuseIdentifier:@"testCell"];
    }
    return _collectionView;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 100;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identify = @"testCell";
    WaggleCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    return cell;
    
}


@end
