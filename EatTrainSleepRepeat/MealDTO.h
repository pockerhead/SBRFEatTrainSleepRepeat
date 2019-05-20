//
//  MealDTO.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 19/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataService.h"
@class Meal;

NS_ASSUME_NONNULL_BEGIN

@interface MealDTO : NSObject

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) float kkal;
@property (nonatomic) float weight;
@property (nonatomic) float protein;
@property (nonatomic) float carbonhydrate;
@property (nonatomic) float fat;

- (Meal *)CDWithContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END
