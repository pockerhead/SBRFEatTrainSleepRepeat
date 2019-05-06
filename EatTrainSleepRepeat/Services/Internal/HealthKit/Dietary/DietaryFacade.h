//
//  DietaryFacade.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 07/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DietaryFacade : NSObject

- (void)requestValuesWithCompletion:(void(^)(void))completion;

// MARK: - Calories
@property (strong, nonatomic) NSNumber *caloriesValue;
@property (strong, nonatomic) NSString *caloriesStringValue;

// MARK: - БЖУ

@property (strong, nonatomic) NSNumber *proteinsValue;
@property (strong, nonatomic) NSString *proteinsStringValue;

@property (strong, nonatomic) NSNumber *fatsValue;
@property (strong, nonatomic) NSString *fatsStringValue;

@property (strong, nonatomic) NSNumber *carbonhydratesValue;
@property (strong, nonatomic) NSString *carbonhydratesStringValue;

@end

NS_ASSUME_NONNULL_END
