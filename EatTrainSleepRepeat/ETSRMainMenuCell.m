//
//  MainMenuCell.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "ETSRMainMenuCell.h"
#import "UIView+Constraints.h"
#import <Masonry.h>

@interface ETSRMainMenuCell ()

@property (strong, nonatomic) UITextView *title;
@property (strong, nonatomic) UILabel *subtitle;
@property (strong, nonatomic) UIActivityIndicatorView *activity;
@property (strong, nonatomic) UIView *backView;

@end

@implementation ETSRMainMenuCell

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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _backView = [UIView new];
    [self.contentView addSubview:_backView];
    _title = [UITextView new];
    [_backView addSubview:_title];
    _subtitle = [UILabel new];
    [_backView addSubview:_subtitle];
    _activity = [UIActivityIndicatorView new];
    _activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    [_backView addSubview:_activity];
    
    _title.font = [UIFont systemFontOfSize:18 weight:UIFontWeightMedium];
//    _title.numberOfLines = 0;
    [_title setScrollEnabled:NO];
    _title.backgroundColor = UIColor.clearColor;
    _subtitle.font = [UIFont systemFontOfSize:40 weight:UIFontWeightRegular];
    
    __weak typeof(self) weakSelf = self;

    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.backView.superview).with.insets(UIEdgeInsetsMake(4, 8, 4, 8));
    }];
    
    _backView.layer.cornerRadius = 8;
    _backView.clipsToBounds = YES;
    _backView.backgroundColor = [UIColor darkGrayColor];
    
    _title.textColor = [UIColor whiteColor];
    _subtitle.textColor = [UIColor whiteColor];
    _title.textContainerInset = UIEdgeInsetsMake(4, 0, 4, 0);
    [_title setUserInteractionEnabled:NO];
    [_subtitle anchorCenterYToSuperview];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.title.superview.mas_left).with.offset(16);
        make.top.equalTo(weakSelf.title.superview.mas_top).with.offset(8);
        make.bottom.equalTo(weakSelf.title.superview.mas_bottom).with.offset(-8);
    

    }];
    
    [_subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.greaterThanOrEqualTo(weakSelf.title.mas_right).with.offset(16);
        make.right.equalTo(weakSelf.subtitle.superview.mas_right).with.offset(-16);
        make.top.equalTo(weakSelf.subtitle.superview.mas_top).with.offset(8);
        make.bottom.greaterThanOrEqualTo(weakSelf.subtitle.superview.mas_bottom).with.offset(-8);
        make.height.greaterThanOrEqualTo(@40);
    }];
    [_title setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [_subtitle setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    [_activity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.greaterThanOrEqualTo(weakSelf.title.mas_right).with.offset(16);
        make.right.equalTo(weakSelf.subtitle.superview.mas_right).with.offset(-16);
        make.top.greaterThanOrEqualTo(weakSelf.subtitle.superview.mas_top).with.offset(8);
        make.bottom.greaterThanOrEqualTo(weakSelf.subtitle.superview.mas_bottom).with.offset(-8);
        make.height.greaterThanOrEqualTo(@40);
    }];
}

- (void)configureWithViewModel:(MainMenuCellViewModel *)viewModel
{
    self.title.text = viewModel.title;
    self.subtitle.text = viewModel.subtitle;
    self.backView.backgroundColor = viewModel.color;
    [self.subtitle sizeToFit];
    if (viewModel.needActivity) {
        [self.activity startAnimating];
        [self.activity setHidden:NO];
        [self.subtitle setHidden:YES];
    } else {
        [self.activity stopAnimating];
        [self.activity setHidden:YES];
        [self.subtitle setHidden:NO];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [UIView animateWithDuration:0.3 animations:^{
        self.backView.transform = CGAffineTransformMakeScale(0.9, 0.9);
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [UIView animateWithDuration:0.3 animations:^{
        self.backView.transform = CGAffineTransformIdentity;
    }];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [UIView animateWithDuration:0.3 animations:^{
        self.backView.transform = CGAffineTransformIdentity;
    }];
}

@end
