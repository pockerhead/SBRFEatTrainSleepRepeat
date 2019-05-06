//
//  MainMenuCell.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "MainMenuCell.h"
#import "UIView+Constraints.h"

@interface MainMenuCell ()

@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UILabel *subtitle;
@property (strong, nonatomic) UIImageView *image;
@property (strong, nonatomic) UIActivityIndicatorView *activity;

@end

@implementation MainMenuCell

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
    _title = [UILabel new];
    [self.contentView addSubview:_title];
    _subtitle = [UILabel new];
    [self.contentView addSubview:_subtitle];
    _image = [UIImageView new];
    [self.contentView addSubview:_image];
    _activity = [UIActivityIndicatorView new];
    _activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.contentView addSubview:_activity];

//    _image.backgroundColor = UIColor.clearColor;
    [_image anchorCenterYToSuperview];
    _title.translatesAutoresizingMaskIntoConstraints = NO;
    _subtitle.translatesAutoresizingMaskIntoConstraints = NO;
    _subtitle.numberOfLines = 0;
    _subtitle.minimumScaleFactor = 0.4;

    _image.tintColor = UIColor.grayColor;
    NSInteger imageEdge = 50;
    [NSLayoutConstraint activateConstraints:@[
                                              [_image.leftAnchor constraintEqualToAnchor:_image.superview.leftAnchor constant:16],
                                              [_image.widthAnchor constraintEqualToConstant:imageEdge],
                                              [_image.heightAnchor constraintEqualToConstant:imageEdge],
                                              [_title.leftAnchor constraintEqualToAnchor:_image.rightAnchor constant:8],
                                              [_title.rightAnchor constraintEqualToAnchor:_title.superview.rightAnchor constant:-8],
                                              [_title.topAnchor constraintEqualToAnchor:_title.superview.topAnchor constant:8],
                                              [_subtitle.leftAnchor constraintEqualToAnchor:_image.rightAnchor constant:8],
                                              [_subtitle.rightAnchor constraintEqualToAnchor:_title.superview.rightAnchor constant:-8],
                                              [_subtitle.topAnchor constraintEqualToAnchor:_title.bottomAnchor constant:8],
                                              [_subtitle.bottomAnchor constraintEqualToAnchor:_subtitle.superview.bottomAnchor constant:-8]
                                              ]];
    
    
    
}

- (void)configureWithViewModel:(MainMenuCellViewModel *)viewModel
{
    UIImage *image = [[UIImage imageWithData:viewModel.imageData] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    if (image)
    {
        self.image.image = image;
    }
    
    self.title.text = viewModel.title;
    self.subtitle.text = viewModel.subtitle;
    if (viewModel.needActivity) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.accessoryView = self.activity;
        [self.activity startAnimating];
    } else {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.accessoryView = nil;
        [self.activity stopAnimating];
    }
}

@end
