//
//  TableViewAnimationVC.m
//  PopPushAnimation
//
//  Created by Pengbo on 2016/12/21.
//  Copyright © 2016年 Pengbo. All rights reserved.
//

#import "TableViewAnimationVC.h"
#import "DidSelectAnimationCell.h"

@interface TableViewAnimationVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView * tableView;

@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *chooseArray;
@end

@implementation TableViewAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray arrayWithArray:@[@"王国纪元",@"我守护的一切",@"世界文明"]];
    }
    return _dataArray;
}

- (NSMutableArray *)chooseArray {
    if (_chooseArray == nil) {
        _chooseArray = [NSMutableArray arrayWithArray:@[@(NO),@(NO),@(NO)]];
    }
    return _chooseArray;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[DidSelectAnimationCell class] forCellReuseIdentifier:@"animationCell"];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DidSelectAnimationCell * cell = [tableView dequeueReusableCellWithIdentifier:@"animationCell"];
    cell.name.text = self.dataArray[indexPath.row];
    
    if ([self.chooseArray[indexPath.row] boolValue] == NO) {
        [cell hideIconAnimation:NO];
    }else {
        [cell showIconAnimation:NO];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DidSelectAnimationCell * cell = (DidSelectAnimationCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    [cell showSelectedAnimation];
    
    if ([self.chooseArray[indexPath.row] boolValue] == NO) {
        [self.chooseArray replaceObjectAtIndex:indexPath.row withObject:@(YES)];
        [cell showIconAnimation:YES];
    }else {
        [self.chooseArray replaceObjectAtIndex:indexPath.row withObject:@(NO)];
        [cell hideIconAnimation:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return TRANS_H(80);
}

@end
