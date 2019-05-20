//
//  DateService.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 20/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DateService : NSObject

- (NSDate *)getStartOfDayForDate:(NSDate *)date;
- (NSDate *)getEndOfDayForDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
