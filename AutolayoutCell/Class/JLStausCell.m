//
//  JLStausCell.m
//  AutolayoutCell
//
//  Created by 张天龙 on 17/3/1.
//  Copyright © 2017年 张天龙. All rights reserved.
//

#import "JLStausCell.h"
#import "JLStasus.h"

@interface JLStausCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vipView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;

@end

@implementation JLStausCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    JLStausCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // 设置label每一行文字的最大宽度
    // 为了保证计算出来的数值跟真正显示出来的效果一致
    //给标签设置最大的长度，根据屏幕尺寸改变
    self.contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
}

- (void)setStatus:(JLStasus *)status
{
    _status = status;
    
    if (status.isVip) {
        self.nameLabel.textColor = [UIColor orangeColor];
        self.vipView.hidden = NO;
    } else {
        self.nameLabel.textColor = [UIColor blackColor];
        self.vipView.hidden = YES;
    }
    
    self.nameLabel.text = status.name;
    self.iconView.image = [UIImage imageNamed:status.icon];
    if (status.picture) {
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:status.picture];
    } else {
        self.pictureView.hidden = YES;
    }
    self.contentLabel.text = status.text;
    
    //一旦强制布局，就会计算出子控件的位置尺寸，方便下面计算cell的高度
    [self layoutIfNeeded];
    
    // 计算cell的高度
    if (self.pictureView.hidden) { // 没有配图
        status.cellHeight = CGRectGetMaxY(self.contentLabel.frame) + 10;
    } else { // 有配图
        status.cellHeight = CGRectGetMaxY(self.pictureView.frame) + 10;
    }
}



@end
