//
//  MealTime+CoreDataProperties.m
//  
//
//  Created by pockerhead on 07/05/2019.
//
//

#import "MealTime+CoreDataProperties.h"

@implementation MealTime (CoreDataProperties)

+ (NSFetchRequest<MealTime *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"MealTime"];
}

@dynamic mealDescription;
@dynamic name;
@dynamic meals;

@end
