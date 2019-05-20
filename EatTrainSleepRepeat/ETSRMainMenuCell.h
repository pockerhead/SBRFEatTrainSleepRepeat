//
//  MainMenuCell.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ETSRMainMenuCell : UITableViewCell

- (void)configureWithViewModel:(MainMenuCellViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
