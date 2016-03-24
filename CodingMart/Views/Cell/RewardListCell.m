//
//  RewardListCell.m
//  CodingMart
//
//  Created by Ease on 15/10/9.
//  Copyright © 2015年 net.coding. All rights reserved.
//

#import "RewardListCell.h"
#import "UIImageView+WebCache.h"

@interface RewardListCell()
@property (weak, nonatomic) IBOutlet UILabel *rewardNumL;
@property (weak, nonatomic) IBOutlet UIImageView *coverView;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UIImageView *typeImgView;
@property (weak, nonatomic) IBOutlet UILabel *typeL;
@property (weak, nonatomic) IBOutlet UILabel *_priceL;
@property (weak, nonatomic) IBOutlet UILabel *statusL;
@property (weak, nonatomic) IBOutlet UILabel *roleTypesL;

@end

@implementation RewardListCell

- (void)awakeFromNib {
    // Initialization code
    CGFloat coverViewWidth = kScreen_Width - 24.0;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, coverViewWidth, coverViewWidth/2)];
    CAShapeLayer *mask = [CAShapeLayer layer];
    mask.path = path.CGPath;
    _coverView.layer.mask = mask;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCurReward:(Reward *)curReward{
    if (!curReward) {
        return;
    }
    _curReward = curReward;
    [_curReward prepareToDisplay];

    _rewardNumL.text = [NSString stringWithFormat:@" No.%@  ", _curReward.id.stringValue];
    [_coverView sd_setImageWithURL:[NSURL URLWithString:_curReward.cover] placeholderImage:[UIImage imageNamed:@"placeholder_reward_cover"]];
    _titleL.text = _curReward.title;
    _typeImgView.image = [UIImage imageNamed:_curReward.typeImageName];
    _typeL.text = _curReward.typeDisplay;
    __priceL.text = _curReward.format_price;
    _statusL.text = _curReward.statusDisplay;
    _statusL.textColor = [UIColor colorWithHexString:_curReward.statusStrColorHexStr];
    _statusL.backgroundColor = [UIColor colorWithHexString:_curReward.statusBGColorHexStr];
    _roleTypesL.text = _curReward.roleTypesDisplay;
}

+ (CGFloat)cellHeight{
    return 100;
}

@end
