//
//  MealTableFooter.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 19/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "MealTableFooter.h"
#import "UIView+Constraints.h"
#import <Masonry.h>
#import "EatTrainSleepRepeat-Swift.h"
#import "UIView+CornerRadius.h"

@interface MealTableFooter ()

@property (strong, nonatomic) UIButton *addMealButton;
@property (nonatomic, copy, nullable) void (^tapAction)(void);
@property (nonatomic, strong) UIView *backView;
@property (strong, nonatomic) UIView *separatorView;

@end

@implementation MealTableFooter

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self)
    {
        _backView = [UIView new];
        [self addSubview:_backView];
        _addMealButton = [UIButton new];
        [_backView addSubview:_addMealButton];
        [self configureUI];
    }
    return self;
}

- (void)configureUI
{
    __weak typeof(self) weakSelf = self;
    _separatorView = [UIView new];
    [_backView addSubview:_separatorView];
    [_separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.separatorView.superview.mas_left).with.offset(0);
        make.top.equalTo(weakSelf.separatorView.superview.mas_top).with.offset(0);
        make.right.equalTo(weakSelf.separatorView.superview.mas_right).with.offset(0);
        make.height.equalTo(@0.5);
    }];
    _separatorView.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.4];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.backView.superview).with.insets(UIEdgeInsetsMake(0, 8, 16, 8));
    }];
    _backView.backgroundColor = UIColor.mainGreen;
    [_addMealButton fillSuperview];
    [_addMealButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [_addMealButton setTitle:@"+" forState:UIControlStateNormal];
    _addMealButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [_addMealButton addTarget:self action:@selector(didSelectAddMealButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)layoutSubviews
{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.backView cornerRadiusWithCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight) radius:10];
        });
}

- (void)configureWithViewModel:(MealTableFooterViewModel *)viewModel
{
    self.tapAction = viewModel.tapAction;
}

- (void)didSelectAddMealButton
{
    if (self.tapAction)
    {
        self.tapAction();
    }
}

@end
