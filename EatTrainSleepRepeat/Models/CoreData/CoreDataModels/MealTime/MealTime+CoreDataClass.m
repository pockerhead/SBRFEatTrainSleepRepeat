//
//  MealTime+CoreDataClass.m
//  
//
//  Created by pockerhead on 19/05/2019.
//
//

#import "MealTime+CoreDataClass.h"
#import "Meal+CoreDataClass.h"

@implementation MealTime

- (MealTimeDTO *)DTO
{
    MealTimeDTO *dto = [MealTimeDTO new];
    dto.name = self.name;
    dto.mealDescription = self.mealDescription;
    dto.totalProtein = self.totalProtein;
    dto.totalFats = self.totalFats;
    dto.totalCarbonhydrates = self.totalCarbonhydrates;
    dto.totalKcal = self.totalKcal;
    NSArray <Meal *> *meals = [self.meals allObjects];
    NSMutableArray *mealDTOs = [NSMutableArray new];
    for (Meal *meal in meals) {
        MealDTO *dto = [meal DTO];
        [mealDTOs addObject:dto];
    }
    dto.meals = mealDTOs;
    dto.date = self.date;
    return dto;
}


@end
