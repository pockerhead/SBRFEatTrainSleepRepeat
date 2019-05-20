//
//  ETSRTextFieldCell.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 20/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "ETSRTextFieldCell.h"
#import <Masonry.h>


@interface ETSRTextFieldCell ()

@property (strong, nonatomic) UITextField *textField;
@property (nonatomic, copy, nullable) void (^textDidEntered)(NSString * _Nullable text);

@end

@implementation ETSRTextFieldCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self configureUI];
    }
    return self;
}

- (void)configureUI
{
    _textField = [UITextField new];
    [self.contentView addSubview:_textField];
    __weak typeof(self) weakSelf = self;
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.textField.superview).with.insets(UIEdgeInsetsMake(16, 8, 4, 8));
        make.height.equalTo(@32);
    }];
    [_textField addTarget:self action:@selector(didEnterValueIn:) forControlEvents:UIControlEventEditingChanged];
    [_textField addTarget:self action:@selector(didEndEnterValueIn) forControlEvents:UIControlEventEditingDidEnd];

}

- (void)configureWithViewModel:(ETSRTextFieldCellViewModel *)viewModel
{
    [self.textField setUserInteractionEnabled:NO];
    self.textField.placeholder = viewModel.placeholder;
    self.textField.text = viewModel.text;
    self.textDidEntered = viewModel.textDidEntered;
    self.textField.keyboardType = viewModel.keyboardType;
}

- (void)didEnterValueIn:(UITextField *)textField
{
    self.textDidEntered(textField.text);
}

- (void)didEndEnterValueIn
{
    [self.textField setUserInteractionEnabled:NO];
}

- (void)editTextfield
{
    [self.textField setUserInteractionEnabled:YES];
    [self.textField becomeFirstResponder];
}

@end
