//
//  MealsRepository.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 19/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "MealsRepository.h"
#import "CoreDataService.h"
#import "MealTime+CoreDataClass.h"
#import "HealthService.h"
#import "DateService.h"

@implementation MealsRepository

- (NSArray<MealTimeDTO *> *)getMealsWithDate:(NSDate *)date
{
    DateService *dateService = [DateService new];
    NSMutableArray<MealTimeDTO *> *meals = [NSMutableArray arrayWithArray:@[]];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MealTime"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(date >= %@) AND (date <= %@)", [dateService getStartOfDayForDate:date], [dateService getEndOfDayForDate:date]];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
    request.predicate = predicate;
    request.sortDescriptors = @[sortDescriptor];
    NSError *error = nil;
    NSArray <MealTime *> *mealsCD = [[CoreDataService shared].persistentContainer.viewContext executeFetchRequest:request error:&error];
    if (error)
    {
        NSLog(@"%@", error);
        return @[];
    }
    else
    {
        for (MealTime *mealTime in mealsCD) {
            MealTimeDTO *dto = [mealTime DTO];
            [meals addObject:dto];
        }
        return meals;
    }
}

- (void)saveMeals:(NSArray<MealTimeDTO *> *)meals atDate:(NSDate *)date
{
    NSManagedObjectContext *context = [CoreDataService shared].persistentContainer.viewContext;
    DateService *dateService = [DateService new];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MealTime"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(date >= %@) AND (date <= %@)", [dateService getStartOfDayForDate:date], [dateService getEndOfDayForDate:date]];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
    request.predicate = predicate;
    request.sortDescriptors = @[sortDescriptor];
    NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:request];
    
    NSError *deleteError = nil;
    [[CoreDataService shared].persistentContainer.persistentStoreCoordinator executeRequest:delete withContext:context error:&deleteError];
    float dailyKcal = 0;
    float dailyProteins = 0;
    float dailyCarbonhydrates = 0;
    float dailyFats = 0;
    for (MealTimeDTO *meal in meals) {
        [meal CDWithContext:context];
        dailyFats += meal.totalFats;
        dailyProteins += meal.totalProtein;
        dailyKcal += meal.totalKcal;
        dailyCarbonhydrates += meal.totalCarbonhydrates;
    }
    [[HealthService sharedInstance] storeDailyValueForQuantityType:HKQuantityTypeIdentifierDietaryFatTotal value:@(dailyFats) completion:nil];
    [[HealthService sharedInstance] storeDailyValueForQuantityType:HKQuantityTypeIdentifierDietaryProtein value:@(dailyProteins) completion:nil];
    [[HealthService sharedInstance] storeDailyValueForQuantityType:HKQuantityTypeIdentifierDietaryCarbohydrates value:@(dailyCarbonhydrates) completion:nil];
    [[HealthService sharedInstance] storeDailyValueForQuantityType:HKQuantityTypeIdentifierDietaryEnergyConsumed value:@(dailyKcal) completion:nil];

    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
    }
}

@end
