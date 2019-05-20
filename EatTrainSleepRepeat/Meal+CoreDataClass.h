//
//  Meal+CoreDataClass.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "MealDTO.h"

NS_ASSUME_NONNULL_BEGIN

@interface Meal : NSManagedObject

- (MealDTO *)DTO;

@end

NS_ASSUME_NONNULL_END

#import "Meal+CoreDataProperties.h"
