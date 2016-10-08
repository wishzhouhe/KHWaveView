//
//  ViewController.m
//  waveView
//
//  Created by qianfeng on 16/9/24.
//  Copyright © 2016年 Arron_zkh. All rights reserved.
//

#import "ViewController.h"
#import "KHWaveView.h"

#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kScreen_Height 300

#define kWaveView_Height 10

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

/** tableView */
@property (nonatomic, weak)  UITableView *tableView;
/** headerView */
@property (nonatomic, weak)  UIView *headerView;
/** waveView */
@property (nonatomic, weak)  KHWaveView *waveView;

@end

@implementation ViewController

#pragma mark - lazy load
- (KHWaveView *)waveView{
    if (!_waveView) {
        KHWaveView *waveView = [KHWaveView addToSuperView:self.headerView WithFrame:CGRectMake(0, CGRectGetHeight(self.headerView.frame) - kWaveView_Height / 2 - 3, self.headerView.frame.size.width, kWaveView_Height)];
        _waveView = waveView;
    }
    return _waveView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView = tableView;
        [self.view addSubview:tableView];
    }
    return _tableView;
    
}

- (UIView *)headerView{
    if (!_headerView) {
        UIView *hview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
        hview.backgroundColor = [self randomColor];
        self.tableView.tableHeaderView = hview;
        _headerView = hview;
    }
    return _headerView;
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = [NSString stringWithFormat:@"%i", arc4random_uniform(100)];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Initialize KHWaveView in default
    [self waveView];
    
    //Initialize KHWaveView with four options
#if 0
    self.waveView.waveColor = [UIColor yellowColor];
    self.waveView.waveSpeed = 15.f;
    self.waveView.waveTime = 0.f;
#endif
    
}

#pragma mark - other methods
- (UIColor *)randomColor{
    return [UIColor colorWithRed:arc4random()%256 / 255.0 green:arc4random()%256 / 255.0 blue:arc4random()%256 / 255.0 alpha:1.0];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    //wave when tableView is dragged
    [self.waveView wave];
    
    //use "stop" method to stop waving
    //[self.waveView stop];
}




@end
