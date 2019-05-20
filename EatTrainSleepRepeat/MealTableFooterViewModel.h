//
//  MealTableFooterViewModel.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 19/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MealTableFooterViewModel : NSObject

@property (nonatomic, copy, nullable) void (^tapAction)(void);

@end

NS_ASSUME_NONNULL_END
