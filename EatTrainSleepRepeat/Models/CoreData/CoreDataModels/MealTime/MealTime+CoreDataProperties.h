//
//  MealTime+CoreDataProperties.h
//  
//
//  Created by pockerhead on 07/05/2019.
//
//

#import "MealTime+CoreDataClass.h"
#import "Meal+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface MealTime (CoreDataProperties)

+ (NSFetchRequest<MealTime *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *mealDescription;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) Meal *meals;

@end

NS_ASSUME_NONNULL_END
