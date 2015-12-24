//
//  HJRMainTableViewCell.m
//  Scanner
//
//  Created by yang on 15/12/24.
//  Copyright © 2015年 JianRongHui. All rights reserved.
//

#import "HJRMainTableViewCell.h"
#import "HJRMainCellModel.h"

@interface HJRMainTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellFirstLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellSecondLabel;

@end

@implementation HJRMainTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"HJRMainTableViewCell" owner:self options:nil];
        self = [nibs firstObject];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configDataSource:(HJRMainCellModel *)model
{
    self.cellImageView.image  = [UIImage imageNamed:model.imageName];
    self.cellFirstLabel.text  = model.cellTitle;
    self.cellSecondLabel.text = model.cellSubTitle;
}

@end
