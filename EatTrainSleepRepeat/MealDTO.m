//
//  MealDTO.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 19/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "MealDTO.h"
#import "Meal+CoreDataClass.h"

@implementation MealDTO

- (Meal *)CDWithContext:(NSManagedObjectContext *)context
{
    Meal *meal = [NSEntityDescription insertNewObjectForEntityForName:@"Meal" inManagedObjectContext:context];
    meal.name = self.name;
    meal.fat = self.fat;
    meal.weight = self.weight;
    meal.carbonhydrate = self.carbonhydrate;
    meal.protein = self.protein;
    meal.kkal = self.kkal;
    return meal;
}

@end
