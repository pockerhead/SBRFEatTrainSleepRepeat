//
//  MealTimeDTO.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 19/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataService.h"
#import "MealDTO.h"
@class MealTime;
@class Meal;

NS_ASSUME_NONNULL_BEGIN

@interface MealTimeDTO : NSObject

@property (nullable, nonatomic, copy) NSString *mealDescription;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) float totalProtein;
@property (nonatomic) float totalCarbonhydrates;
@property (nonatomic) float totalFats;
@property (nonatomic) float totalKcal;
@property (nullable, nonatomic, retain) NSArray<MealDTO *> *meals;
@property (nullable, nonatomic, copy) NSDate *date;

- (MealTime *)CDWithContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END
