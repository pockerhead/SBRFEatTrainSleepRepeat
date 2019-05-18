//
//  WorkoutValues+CoreDataProperties.m
//  
//
//  Created by pockerhead on 18/05/2019.
//
//

#import "WorkoutValues+CoreDataProperties.h"

@implementation WorkoutValues (CoreDataProperties)

+ (NSFetchRequest<WorkoutValues *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"WorkoutValues"];
}

@dynamic date;
@dynamic distanceValue;
@dynamic overallEnergyBurnedValue;
@dynamic stepsValue;

@end
