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
#import "ScannerConfig.h"
#import "HJRMainControllerTitleView.h"

NSString *const kTableViewCellId = @"tableViewCellId";
@interface HJRMainController ()<UITableViewDelegate,UITableViewDataSource,SWTableViewCellDelegate>

@property (nonatomic, strong) UITableView *contentTableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIButton *takePhotoButton;

@end

@implementation HJRMainController

#pragma mark - life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[].mutableCopy;
    
    self.view.backgroundColor = HEXCOLOR(0xe8e9e8);
    [self setUpTitleView];
    [self setUpNavigationBar];
    [self setUpContentTableView];
    [self setUpTakePhotoButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UI
- (void)setUpTitleView
{
    HJRMainControllerTitleView *titleView = [[HJRMainControllerTitleView alloc] init];
    titleView.frame = CGRectMake(0, 0, kScreenWidth, 44);
     self.navigationItem.titleView = titleView;
}
- (void)setUpNavigationBar
{
    self.navigationController.navigationBar.barTintColor = HEXCOLOR(0x26ba95);
    [[UINavigationBar appearance] setTintColor:HEXCOLOR(0x26ba95)];
//    [self creatLeftBarButtonWithTitle:@"编辑" imageName:nil];
//    [self creatRightBarButtonWithTitle:nil imageName:@"add_button"];
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

- (void)setUpTakePhotoButton
{
    CGRect frame = CGRectMake(kScreenWidth - 100, kScreenHeight-100, 60, 60);
    self.takePhotoButton = [UIButton buttonWithType:0];
    self.takePhotoButton.frame = frame;
    self.takePhotoButton.layer.cornerRadius = 30;
    self.takePhotoButton.layer.masksToBounds = YES;
    [self.takePhotoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.takePhotoButton setTitle:@"拍照" forState:UIControlStateNormal];
    self.takePhotoButton.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.takePhotoButton];
    [self.takePhotoButton addTarget:self action:@selector(takePhotoButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 点击事件
- (void)takePhotoButtonAction:(UIButton *)sender
{
    HJRTakePhotoController *vc = [[HJRTakePhotoController alloc] init];
    [vc setTakePhotoCompleteBlock:^(NSString *imagePath) {
        
    }];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - super
- (void)leftBarButtonAction:(UIButton *)sender
{

}

- (void)rightBarButtonAction:(UIButton *)sender
{

//    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDelegate | UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
//    return 10;
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
        cell.rightUtilityButtons = [self cellRightButtons];
        cell.leftUtilityButtons  = [self cellLeftButtons];
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

- (NSArray *)cellRightButtons
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
- (NSArray *)cellLeftButtons
{
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    [leftUtilityButtons sw_addUtilityButtonWithColor:[UIColor whiteColor]
                                          normalIcon:[UIImage imageNamed:@"add_button"]
                                        selectedIcon:[UIImage imageNamed:@"add_button"]];
    return leftUtilityButtons;
}

#pragma mark - other
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

@end
