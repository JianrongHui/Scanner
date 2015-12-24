//
//  HJRMainTableViewCell.h
//  Scanner
//
//  Created by yang on 15/12/24.
//  Copyright © 2015年 JianRongHui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SWTableViewCell/SWTableViewCell.h>

@class HJRMainCellModel;
@interface HJRMainTableViewCell : SWTableViewCell

- (void)configDataSource:(HJRMainCellModel *)model;

@end
