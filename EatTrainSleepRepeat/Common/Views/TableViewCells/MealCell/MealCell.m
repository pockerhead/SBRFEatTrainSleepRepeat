//
//  MealCell.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 07/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "MealCell.h"
#import <Masonry.h>
#import "EatTrainSleepRepeat-Swift.h"


@interface MealCell ()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *subtitleLabel;
@property (strong, nonatomic) UIView *backView;
@property (strong, nonatomic) UIView *separatorView;

@end


@implementation MealCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self configureUI];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureUI
{
    __weak typeof(self) weakSelf = self;
    _backView = [UIView new];
    _backView.backgroundColor = UIColor.mainGreen;
    [self.contentView addSubview:_backView];
    _separatorView = [UIView new];
    [_backView addSubview:_separatorView];
    [_separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.separatorView.superview.mas_left).with.offset(0);
        make.bottom.equalTo(weakSelf.separatorView.superview.mas_bottom).with.offset(0);
        make.right.equalTo(weakSelf.separatorView.superview.mas_right).with.offset(0);
        make.height.equalTo(@0.5);
    }];
    _separatorView.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.4];
    _titleLabel = [UILabel new];
    [_backView addSubview: _titleLabel];
    _subtitleLabel = [UILabel new];
    [_backView addSubview: _subtitleLabel];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.backView.superview).with.insets(UIEdgeInsetsMake(0, 8, 0, 8));
    }];
    _titleLabel.numberOfLines = 0;
    _titleLabel.textColor = UIColor.whiteColor;
    _subtitleLabel.textColor = UIColor.whiteColor;
    _subtitleLabel.font = [UIFont systemFontOfSize:14];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLabel.superview.mas_top).with.offset(16);
        make.left.equalTo(weakSelf.titleLabel.superview.mas_left).with.offset(16);
        make.right.equalTo(weakSelf.titleLabel.superview.mas_right).with.offset(-16);
    }];
    
    [_subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).with.offset(8);
        make.left.equalTo(weakSelf.subtitleLabel.superview.mas_left).with.offset(16);
        make.right.equalTo(weakSelf.subtitleLabel.superview.mas_right).with.offset(-16);
        make.bottom.equalTo(weakSelf.subtitleLabel.superview.mas_bottom).with.offset(-16);
    }];
    
}

- (void)configureWithViewModel:(MealCellViewModel *)viewModel
{
    self.titleLabel.text = viewModel.name;
    self.subtitleLabel.text = viewModel.calloriesTitle;
}

@end
