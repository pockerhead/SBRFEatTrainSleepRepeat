//
//  WorkoutValues+CoreDataProperties.h
//  
//
//  Created by pockerhead on 19/05/2019.
//
//

#import "WorkoutValues+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface WorkoutValues (CoreDataProperties)

+ (NSFetchRequest<WorkoutValues *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *date;
@property (nonatomic) double distanceValue;
@property (nonatomic) int32_t overallEnergyBurnedValue;
@property (nonatomic) int32_t stepsValue;

@end

NS_ASSUME_NONNULL_END
