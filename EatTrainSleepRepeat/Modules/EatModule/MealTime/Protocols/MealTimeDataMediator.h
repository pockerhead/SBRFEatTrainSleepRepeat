//
//  MealTimeDataMediator.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 19/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MealTimeViewModel.h"
#import "MealTableFooterViewModel.h"
#import "MealCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MealTimeDataMediator : NSObject

@property (strong, nonatomic) MealTimeViewModel *sectionHeader;
@property (strong, nonatomic) MealTableFooterViewModel *sectionFooter;
@property (strong, nonatomic) NSArray <MealCellViewModel *> *rows;
@property (strong, nonatomic) NSArray <MealCellViewModel *> *storedRows;
@property (assign, nonatomic) BOOL isExpanded;

@end


NS_ASSUME_NONNULL_END
