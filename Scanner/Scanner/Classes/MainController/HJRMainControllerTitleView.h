//
//  HJRMainControllerTitleView.h
//  Scanner
//
//  Created by yang on 15/12/30.
//  Copyright © 2015年 JianRongHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol title <NSObject>



@end

@interface HJRMainControllerTitleView : UIView

@property (weak, nonatomic) IBOutlet UIButton *filterButton;
@property (weak, nonatomic) IBOutlet UIButton *showTypeButton;
@property (weak, nonatomic) IBOutlet UIButton *sortButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end
