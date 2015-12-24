//
//  HJRBaseController.m
//  Scanner
//
//  Created by yang on 15/12/24.
//  Copyright © 2015年 JianRongHui. All rights reserved.
//

#import "HJRBaseController.h"
#import "ScannerConfig.h"

@interface HJRBaseController ()

@end

@implementation HJRBaseController

#pragma mark - life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
   
    if (self.navigationController.viewControllers.count > 1)
    {
        [self creatLeftBarButtonWithTitle:nil imageName:@"nav_btn_back"];
    }
}

#pragma mark - UI

- (void)setTitle:(NSString *)title
{
    UILabel *titleLabel = [UILabel new];
    titleLabel.frame = CGRectMake(0, 0, 500, 40);
//    titleLabel.backgroundColor = [UIColor yellowColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:16.0f];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = title;
    self.navigationItem.titleView = titleLabel;
}

- (void)creatLeftBarButtonWithTitle:(NSString *)title imageName:(NSString *)image
{
    UIButton *leftBtn = [UIButton buttonWithType:0];
    leftBtn.frame = CGRectMake(0, 0, 60, 45);
    [leftBtn setTitleColor:HEXCOLOR(0x007aff) forState:UIControlStateNormal];
    [leftBtn setTitle:title forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [leftBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    [leftBtn addTarget:self action:@selector(leftBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];

    // layout iamge and title
    if (title.length > 0 && image.length > 0)
    {
        leftBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    }
    else if (image.length > 0 && ((title.length < 1)|| !title))
    {
        leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    }
    else if (title.length > 0 && ((image.length < 1)|| !image))
    {
        leftBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    }
}
- (void)creatRightBarButtonWithTitle:(NSString *)title imageName:(NSString *)image
{
    UIButton *rightBtn = [UIButton buttonWithType:0];
    rightBtn.frame = CGRectMake(0, 0, 60, 45);
    [rightBtn setTitleColor:HEXCOLOR(0x007aff) forState:UIControlStateNormal];
    [rightBtn setTitle:title forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [rightBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(rightBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    // layout iamge and title
    if (title.length > 0 && image.length > 0)
    {
        rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    }
    else if (image.length > 0 && ((title.length < 1)|| !title))
    {
        rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -30);
    }
    else if (title.length > 0 && ((image.length < 1)|| !image))
    {
        rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    }
}

#pragma mark - 点击事件
- (void)leftBarButtonAction:(UIButton *)sender
{
    if (self.presentingViewController)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)rightBarButtonAction:(UIButton *)sender
{
    // 子类重载该方法.
}



@end
