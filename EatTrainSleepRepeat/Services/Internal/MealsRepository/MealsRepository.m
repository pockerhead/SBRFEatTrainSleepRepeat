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

@implementation MealsRepository

- (NSArray<MealTimeDTO *> *)getMealsWithDate:(NSDate *)date
{
    NSMutableArray<MealTimeDTO *> *meals = [NSMutableArray arrayWithArray:@[]];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MealTime"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"date = %@", date];
    request.predicate = predicate;
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
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"MealTime"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"date = %@", date];
    request.predicate = predicate;
    NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:request];
    
    NSError *deleteError = nil;
    [[CoreDataService shared].persistentContainer.persistentStoreCoordinator executeRequest:delete withContext:context error:&deleteError];
    for (MealTimeDTO *meal in meals) {
        [meal CDWithContext:context];
    }
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
    }
}

@end
