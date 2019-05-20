//
//  MealTableViewHeader.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 07/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "MealTableViewHeader.h"
#import <Masonry.h>
#import "EatTrainSleepRepeat-Swift.h"
#import "UIView+CornerRadius.h"
#import "UIView+Constraints.h"


@interface MealTableViewHeader ()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *expandIndicator;
@property (strong, nonatomic) UIView *backView;
@property (strong, nonatomic) UIView *separatorView;
@property (nonatomic, copy, nullable) void (^tapAction)(void);

@end

@implementation MealTableViewHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self configureUI];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSelectSelf)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)configureUI
{
    __weak typeof(self) weakSelf = self;
    _backView = [UIView new];
    [self addSubview:_backView];
    _separatorView = [UIView new];
    [_backView addSubview:_separatorView];
    [_separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.separatorView.superview.mas_left).with.offset(0);
        make.bottom.equalTo(weakSelf.separatorView.superview.mas_bottom).with.offset(0);
        make.right.equalTo(weakSelf.separatorView.superview.mas_right).with.offset(0);
        make.height.equalTo(@0.5);
    }];
    _separatorView.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.4];
    _backView.backgroundColor = UIColor.mainGreen;
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.backView.superview).with.insets(UIEdgeInsetsMake(16, 8, 0, 8));
    }];
    _titleLabel = [UILabel new];
    _titleLabel.textColor = UIColor.whiteColor;
    _titleLabel.numberOfLines = 0;
    [_backView addSubview:_titleLabel];
    _expandIndicator = [UIImageView new];
    [_backView addSubview:_expandIndicator];
    _expandIndicator.image = [[UIImage imageNamed:@"disclosure"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    _expandIndicator.tintColor = [UIColor whiteColor];
    _expandIndicator.contentMode = UIViewContentModeScaleToFill;
    [_expandIndicator anchorCenterYToSuperview];
    [_expandIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.greaterThanOrEqualTo(weakSelf.expandIndicator.superview.mas_top).with.offset(16);
//        make.bottom.greaterThanOrEqualTo(weakSelf.expandIndicator.superview.mas_bottom).with.offset(-16);
        make.right.equalTo(weakSelf.expandIndicator.superview.mas_right).with.offset(-16);
        make.height.equalTo(@16);
        make.width.equalTo(@8);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.titleLabel.superview.mas_left).with.offset(16);
        make.top.equalTo(weakSelf.titleLabel.superview.mas_top).with.offset(8);
        make.bottom.equalTo(weakSelf.titleLabel.superview.mas_bottom).with.offset(-8);
        make.right.equalTo(weakSelf.expandIndicator.mas_left).with.offset(-8);
    }];
    [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
}

- (void)layoutSubviews
{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.backView cornerRadiusWithCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) radius:10];
        });
}

- (void)configureWithViewModel:(MealTimeViewModel *)viewModel
{
    self.tapAction = viewModel.tapAction;
    self.titleLabel.text = viewModel.mealTimeName;
    if (viewModel.isExpanded)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.expandIndicator.transform = CGAffineTransformMakeRotation(M_PI * 1/2);
        }];
    }
    else
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.expandIndicator.transform = CGAffineTransformIdentity;
        }];
    }
}

- (void)didSelectSelf
{
    if (self.tapAction)
    {
        self.tapAction();
    }
}

@end
