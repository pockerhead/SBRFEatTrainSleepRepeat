//
//  MealTimeViewModel.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 07/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MealTimeViewModel : NSObject

@property (strong, nonatomic) NSString *mealTimeName;
@property (assign, nonatomic) BOOL isExpanded;

@end

NS_ASSUME_NONNULL_END
