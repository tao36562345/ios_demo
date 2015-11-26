//
//  ViewController.m
//  MyChest
//
//  Created by dengtao on 15/11/26.
//  Copyright © 2015年 dengtao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *allActionTableView;
    NSMutableArray *actionMutableArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 准备数据
    [self prepareData];
    
    // 初始化界面
    [self loadSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 初始化界面
- (void)prepareData
{
    actionMutableArray = [[NSMutableArray alloc] init];
    [actionMutableArray addObject:@"聊天的气泡效果"];
}

- (void)loadSubviews
{
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, 50)];
    titleLable.text = @"偶滴百宝箱";
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:titleLable];
    
    // 功能列表
    CGFloat tableViewY = CGRectGetMaxY(titleLable.frame);
    allActionTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableViewY, SCREEN_WIDTH, SCREEN_HEIGHT-tableViewY)
                                                      style:UITableViewStylePlain];
    allActionTableView.delegate = self;
    allActionTableView.dataSource = self;
    allActionTableView.tableFooterView = [UIView new];
    [self.view addSubview:allActionTableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return actionMutableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    cell.textLabel.text = [actionMutableArray objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
