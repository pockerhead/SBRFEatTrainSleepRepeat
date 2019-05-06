//
//  MealTime+CoreDataProperties.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//

#import "MealTime+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MealTime (CoreDataProperties)

+ (NSFetchRequest<MealTime *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *mealDescription;
@property (nullable, nonatomic, retain) NSObject *meals;

@end

NS_ASSUME_NONNULL_END
