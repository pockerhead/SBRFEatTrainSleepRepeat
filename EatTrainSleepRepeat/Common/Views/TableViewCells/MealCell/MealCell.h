//
//  MealCell.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 07/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MealCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MealCell : UITableViewCell

- (void)configureWithViewModel:(MealCellViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
