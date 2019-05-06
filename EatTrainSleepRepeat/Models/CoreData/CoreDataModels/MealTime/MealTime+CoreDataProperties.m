//
//  MealTime+CoreDataProperties.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//

#import "MealTime+CoreDataProperties.h"

@implementation MealTime (CoreDataProperties)

+ (NSFetchRequest<MealTime *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"MealTime"];
}

@dynamic name;
@dynamic mealDescription;
@dynamic meals;

@end
