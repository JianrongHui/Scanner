//
//  HJRMainController.m
//  Scanner
//
//  Created by yang on 15/12/24.
//  Copyright © 2015年 JianRongHui. All rights reserved.
//

#import "HJRMainController.h"
#import "HJRMainTableViewCell.h"
#import "HJRMainCellModel.h"
#import "ScannerConfig.h"
#import "HJRTakePhotoController.h"

NSString *const kTableViewCellId = @"tableViewCellId";
@interface HJRMainController ()<UITableViewDelegate,UITableViewDataSource,SWTableViewCellDelegate>

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
    [self creatLeftBarButtonWithTitle:@"编辑" imageName:nil];
    [self creatRightBarButtonWithTitle:nil imageName:@"add_button"];
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

#pragma mark - super
- (void)leftBarButtonAction:(UIButton *)sender
{

}

- (void)rightBarButtonAction:(UIButton *)sender
{
    HJRTakePhotoController *vc = [[HJRTakePhotoController alloc] init];
    [vc setTakePhotoCompleteBlock:^(NSString *imagePath) {
        
    }];
    [self presentViewController:vc animated:YES completion:nil];
//    [self.navigationController pushViewController:vc animated:YES];
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
    HJRMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellId];
    
    if (cell == nil) {
        cell = [[HJRMainTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kTableViewCellId];
        cell.rightUtilityButtons = [self rightButtons];
        cell.leftUtilityButtons  = [self leftButtons];
        cell.delegate = self;
    }
    cell.delegate = self;
    HJRMainCellModel *model = [[HJRMainCellModel alloc] init];
    model.cellTitle = @"发给学校的身份证";
    model.cellSubTitle = @"2015-12-25";
    model.imageName = @"fileImage";
    [cell configDataSource:model];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons sw_addUtilityButtonWithColor:HEXCOLOR(0xfe3b30)
                                                title:@"删除"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:HEXCOLOR(0xff9500)
                                                title:@"置顶"];
    [rightUtilityButtons sw_addUtilityButtonWithColor:HEXCOLOR(0x666666)
                                                title:@"重命名"];
    return rightUtilityButtons;
}
- (NSArray *)leftButtons
{
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    [leftUtilityButtons sw_addUtilityButtonWithColor:[UIColor whiteColor]
                                          normalIcon:[UIImage imageNamed:@"add_button"]
                                        selectedIcon:[UIImage imageNamed:@"add_button"]];
    return leftUtilityButtons;
}

@end
