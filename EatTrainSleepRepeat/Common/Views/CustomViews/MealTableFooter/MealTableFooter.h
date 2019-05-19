//
//  MealTableFooter.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 19/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MealTableFooterViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MealTableFooter : UITableViewHeaderFooterView

- (void)configureWithViewModel:(MealTableFooterViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
