//
//  ETSRTextFieldCell.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 20/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ETSRTextFieldCellViewModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface ETSRTextFieldCell : UITableViewCell

- (void)configureWithViewModel:(ETSRTextFieldCellViewModel *)viewModel;
- (void)editTextfield;

@end

NS_ASSUME_NONNULL_END
