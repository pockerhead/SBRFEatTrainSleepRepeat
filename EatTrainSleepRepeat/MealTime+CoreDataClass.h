//
//  MealTime+CoreDataClass.h
//  
//
//  Created by pockerhead on 19/05/2019.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "MealTimeDTO.h"

@class Meal;
@class MealDTO;

NS_ASSUME_NONNULL_BEGIN

@interface MealTime : NSManagedObject

- (MealTimeDTO *)DTO;

@end

NS_ASSUME_NONNULL_END

#import "MealTime+CoreDataProperties.h"
