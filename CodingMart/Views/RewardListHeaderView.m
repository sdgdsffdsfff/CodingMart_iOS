//
//  RewardListHeaderView.m
//  CodingMart
//
//  Created by Ease on 15/10/9.
//  Copyright © 2015年 net.coding. All rights reserved.
//

#import "RewardListHeaderView.h"
@interface RewardListHeaderView()
@property (strong, nonatomic) UIView *lineV;
@end

@implementation RewardListHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.leftBtn];
        [self addSubview:self.rightBtn];
        [self addSubview:self.lineV];
        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self);
        }];
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(self);
            make.left.equalTo(self.leftBtn.mas_right);
            make.width.equalTo(self.leftBtn);
        }];
        [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_centerX);
            make.width.mas_equalTo(0.5);
            make.top.equalTo(self).offset(5);
            make.bottom.equalTo(self).offset(-5);
        }];
    }
    return self;
}
- (UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [self p_buttonWithTitle:@"码市介绍" imageName:@"mart_introduce_icon"];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [self p_buttonWithTitle:@"发布悬赏" imageName:@"publish_reward_icon"];
    }
    return _rightBtn;
}
- (UIButton *)p_buttonWithTitle:(NSString *)title imageName:(NSString *)imageName{
    UIButton *button = [UIButton new];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitleColor:[UIColor colorWithHexString:@"0x222222"] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    CGFloat padding = 16;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, padding/2, 0, -padding/2);
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -padding/2, 0, padding/2);
    return button;
}
- (UIView *)lineV{
    if (!_lineV) {
        _lineV = [UIView new];
        _lineV.backgroundColor = [UIColor colorWithHexString:@"0xDDDDDD"];
    }
    return _lineV;
}

@end