//
//  MealTime+CoreDataProperties.m
//  
//
//  Created by pockerhead on 19/05/2019.
//
//

#import "MealTime+CoreDataProperties.h"

@implementation MealTime (CoreDataProperties)

+ (NSFetchRequest<MealTime *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"MealTime"];
}

@dynamic mealDescription;
@dynamic name;
@dynamic totalProtein;
@dynamic date;
@dynamic totalCarbonhydrates;
@dynamic totalFats;
@dynamic totalKcal;
@dynamic meals;

@end
