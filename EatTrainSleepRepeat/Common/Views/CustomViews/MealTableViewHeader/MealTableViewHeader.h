//
//  MealTableViewHeader.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 07/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MealTimeViewModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface MealTableViewHeader : UITableViewHeaderFooterView

- (void)configureWithViewModel:(nullable MealTimeViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
