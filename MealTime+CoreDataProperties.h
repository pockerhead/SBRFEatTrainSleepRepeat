//
//  MealTime+CoreDataProperties.h
//  
//
//  Created by pockerhead on 19/05/2019.
//
//

#import "MealTime+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MealTime (CoreDataProperties)

+ (NSFetchRequest<MealTime *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *mealDescription;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) float totalProtein;
@property (nonatomic) float totalCarbonhydrates;
@property (nonatomic) float totalFats;
@property (nonatomic) float totalKcal;
@property (nullable, nonatomic, retain) NSSet<Meal *> *meals;

@end

@interface MealTime (CoreDataGeneratedAccessors)

- (void)addMealsObject:(Meal *)value;
- (void)removeMealsObject:(Meal *)value;
- (void)addMeals:(NSSet<Meal *> *)values;
- (void)removeMeals:(NSSet<Meal *> *)values;

@end

NS_ASSUME_NONNULL_END
