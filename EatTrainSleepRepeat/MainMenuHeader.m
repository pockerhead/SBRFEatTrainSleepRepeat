//
//  MainMenuHeader.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 09/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "MainMenuHeader.h"
#import <Masonry.h>
#import "UIView+Constraints.h"


@interface MainMenuHeader ()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *iconView;
@property (strong, nonatomic) UIImageView *disclosure;

@end

@implementation MainMenuHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self)
    {
        _titleLabel = [UILabel new];
        _iconView = [UIImageView new];
        _disclosure = [UIImageView new];
        UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        [self.contentView addSubview:blurView];
        [blurView fillSuperview];
        [self.contentView addSubview:_titleLabel];
        [self.contentView addSubview:_iconView];
        [self.contentView addSubview:_disclosure];
        [self configureUI];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSelectSelf)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)configureUI
{
    _titleLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightBold];
    _iconView.tintColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    _iconView.backgroundColor = [UIColor clearColor];
    
    self.contentView.backgroundColor = UIColor.clearColor;
    self.backgroundView.backgroundColor = UIColor.clearColor;
    self.backgroundView = [UIView new];
    self.backgroundColor = UIColor.clearColor;
    __weak typeof(self) weakSelf = self;
    [_iconView anchorCenterYToSuperview];
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(weakSelf.iconView.superview.mas_top).with.offset(16);
        make.left.equalTo(weakSelf.iconView.superview.mas_left).with.offset(16);
        make.bottom.greaterThanOrEqualTo(weakSelf.iconView.superview.mas_bottom).with.offset(-8);
        make.size.with.sizeOffset(CGSizeMake(30, 30));
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(weakSelf.titleLabel.superview.mas_top).with.offset(8);
        make.left.equalTo(weakSelf.iconView.mas_right).with.offset(8);
        make.bottom.equalTo(weakSelf.titleLabel.superview.mas_bottom).with.offset(-8);
    }];
    [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [_disclosure anchorCenterYToSuperview];
    [_disclosure mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.greaterThanOrEqualTo(weakSelf.disclosure.superview.mas_right).with.offset(-20);
        make.height.equalTo(@16);
        make.width.equalTo(@8);
        make.left.equalTo(weakSelf.titleLabel.mas_right).with.offset(8);
//        make.bottom.greaterThanOrEqualTo(weakSelf.disclosure.superview.mas_bottom).with.offset(-8);
//        make.top.greaterThanOrEqualTo(weakSelf.disclosure.superWview.mas_top).with.offset(8);
    }];
    _disclosure.image = [UIImage imageNamed:@"disclosure"];
}

- (void)configureWithViewModel:(MainMenuHeaderViewModel *)viewModel
{
    self.tapAction = viewModel.tapAction;
    self.titleLabel.text = viewModel.name;
    UIImage *image = [[UIImage imageWithData:viewModel.icon] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    if (image)
    {
        self.iconView.image = image;
    }
    
    if (viewModel.isExpanded)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.disclosure.transform = CGAffineTransformMakeRotation(M_PI * 1/2);
        }];
    }
    else
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.disclosure.transform = CGAffineTransformIdentity;
        }];
    }
    [self layoutIfNeeded];
}

- (void)didSelectSelf
{
    self.tapAction();
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [UIView animateWithDuration:0.1 animations:^{
        self.contentView.backgroundColor = UIColor.lightGrayColor;
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [UIView animateWithDuration:0.1 animations:^{
        self.contentView.backgroundColor = UIColor.clearColor;
    }];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [UIView animateWithDuration:0.1 animations:^{
        self.contentView.backgroundColor = UIColor.clearColor;
    }];
}

@end
