//
//  MealsRepository.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 19/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MealTimeDTO.h"

NS_ASSUME_NONNULL_BEGIN

@interface MealsRepository : NSObject

- (NSArray <MealTimeDTO *> *)getMealsWithDate:(NSDate *)date;
- (void)saveMeals:(NSArray<MealTimeDTO *> *)meals atDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
