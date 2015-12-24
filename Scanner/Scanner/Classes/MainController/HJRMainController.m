//
//  HJRMainController.m
//  Scanner
//
//  Created by yang on 15/12/24.
//  Copyright © 2015年 JianRongHui. All rights reserved.
//

#import "HJRMainController.h"

NSString *const kTableViewCellId = @"tableViewCellId";

@interface HJRMainController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *contentTableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation HJRMainController

#pragma mark - life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[].mutableCopy;
    [self creatTestData];
    
    [self setUpNavigationBar];
    [self setUpContentTableView];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#warning ======= 测试数据
- (void)creatTestData
{
    
}

#pragma mark - UI
- (void)setUpNavigationBar
{
    self.title = @"我的文件";
    
    UIButton *leftBtn = [UIButton buttonWithType:0];
    leftBtn.frame = CGRectMake(0, 0, 80, 60);
    [leftBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [leftBtn setTitle:@"编辑" forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];

    UIButton *rightBtn = [UIButton buttonWithType:0];
    rightBtn.frame = CGRectMake(0, 0, 80, 60);
    [rightBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"add_button"] forState:UIControlStateNormal];
}

- (void)setUpContentTableView
{
    CGRect frame = self.view.bounds;
    self.contentTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    self.contentTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    [self.view addSubview:self.contentTableView];
}

#pragma mark - UITableViewDelegate | UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.dataArray.count;
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellId];
    if (cell  == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kTableViewCellId];
    }
    cell.imageView.image = [UIImage imageNamed:@""];
    cell.textLabel.text = @"发给学校的身份证";
    cell.detailTextLabel.text = @"2015-12-24";
    return cell;
}



@end
