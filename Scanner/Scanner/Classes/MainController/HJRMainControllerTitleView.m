//
//  HJRMainControllerTitleView.m
//  Scanner
//
//  Created by yang on 15/12/30.
//  Copyright © 2015年 JianRongHui. All rights reserved.
//

#import "HJRMainControllerTitleView.h"

@implementation HJRMainControllerTitleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HJRMainControllerTitleView" owner:self options:nil];
        self = [nibs lastObject];
    }
    return self;
}


@end
