//
//  MealCell.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 07/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "MealCell.h"
#import <Masonry.h>

@interface MealCell ()

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *kcalLabel;
@property (strong, nonatomic) UILabel *macroNutritionLabel;
@property (strong, nonatomic) UILabel *weightLabel;

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
    _nameLabel = [UILabel new];
    [self.contentView addSubview: _nameLabel];
    _kcalLabel = [UILabel new];
    [self.contentView addSubview: _kcalLabel];
    _macroNutritionLabel = [UILabel new];
    [self.contentView addSubview: _macroNutritionLabel];
    _weightLabel = [UILabel new];
    [self.contentView addSubview: _weightLabel];
    
    _nameLabel.numberOfLines = 2;
    
    __weak typeof(self) weakSelf = self;
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameLabel.superview.mas_top).with.offset(16);
        make.left.equalTo(weakSelf.nameLabel.superview.mas_left).with.offset(16);
        make.right.equalTo(weakSelf.nameLabel.superview.mas_right).with.offset(-16);
    }];
    
    [_kcalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameLabel.mas_bottom).with.offset(8);
        make.left.equalTo(weakSelf.kcalLabel.superview.mas_left).with.offset(16);
        make.right.equalTo(weakSelf.kcalLabel.superview.mas_right).with.offset(-16);
    }];
    
    [_macroNutritionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.kcalLabel.mas_bottom).with.offset(8);
        make.left.equalTo(weakSelf.macroNutritionLabel.superview.mas_left).with.offset(16);
        make.right.equalTo(weakSelf.macroNutritionLabel.superview.mas_right).with.offset(-16);
    }];
    
    [_weightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.macroNutritionLabel.mas_bottom).with.offset(8);
        make.left.equalTo(weakSelf.weightLabel.superview.mas_left).with.offset(16);
        make.right.equalTo(weakSelf.weightLabel.superview.mas_right).with.offset(-16);
        make.bottom.equalTo(weakSelf.weightLabel.superview.mas_bottom).with.offset(-16);
    }];
    
}

- (void)configureWithViewModel:(MealCellViewModel *)viewModel
{
    self.nameLabel.text = viewModel.name;
    self.kcalLabel.text = viewModel.calloriesTitle;
    self.macroNutritionLabel.text = viewModel.macroNutritionTitle;
    self.weightLabel.text = viewModel.weightTitle;
}

@end
