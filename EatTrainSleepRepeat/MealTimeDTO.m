//
//  MealTimeDTO.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 19/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "MealTimeDTO.h"
#import "MealDTO.h"
#import "MealTime+CoreDataClass.h"
#import "Meal+CoreDataClass.h"

@implementation MealTimeDTO

- (MealTime *)CDWithContext:(NSManagedObjectContext *)context
{
    MealTime *mealTime = [NSEntityDescription insertNewObjectForEntityForName:@"MealTime" inManagedObjectContext:context];
    mealTime.mealDescription = self.mealDescription;
    mealTime.name = self.name;
    mealTime.totalFats = self.totalFats;
    mealTime.totalKcal = self.totalKcal;
    mealTime.totalProtein = self.totalProtein;
    mealTime.totalCarbonhydrates = self.totalCarbonhydrates;
    NSMutableArray *meals = [NSMutableArray new];
    for (MealDTO *meal in self.meals) {
        [meals addObject:[meal CDWithContext:context]];
    }
    mealTime.meals = [NSSet setWithArray:[meals copy]];
    mealTime.date = self.date;
    return mealTime;
}

- (float)totalFats
{
    float fat = 0;
    for (MealDTO *meal in self.meals) {
        fat += meal.fat;
    }
    return fat;
}

- (float)totalProtein
{
    float protein = 0;
    for (MealDTO *meal in self.meals) {
        protein += meal.protein;
    }
    return protein;
}

- (float)totalKcal
{
    float Kcal = 0;
    for (MealDTO *meal in self.meals) {
        Kcal += meal.kkal;
    }
    return Kcal;
}

- (float)totalCarbonhydrates
{
    float carbonhydrates = 0;
    for (MealDTO *meal in self.meals) {
        carbonhydrates += meal.carbonhydrate;
    }
    return carbonhydrates;
}

@end
