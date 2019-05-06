//
//  HealthService.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 06/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>
@import HealthKit;

NS_ASSUME_NONNULL_BEGIN

@interface HealthService : NSObject

+ (instancetype)sharedInstance;
- (void)setup;

/**
 Взять значение за день для идентификатора HealthKit

 @param type HKQuantityTypeIdentifier идентификатор значения для HealthKit
 @param completion (void(^)(NSNumber * _Nullable value, NSError * _Nullable error)) - блок комплишна, значение в NSNumber или NSError
 */
- (void)getDailyValueForQuantityType:(HKQuantityTypeIdentifier)type completion:(void(^)(NSNumber * _Nullable value, NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
