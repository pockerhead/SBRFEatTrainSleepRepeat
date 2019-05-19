//
//  Meal+CoreDataClass.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//

#import "Meal+CoreDataClass.h"

@implementation Meal

- (MealDTO *)DTO
{
    MealDTO *dto = [MealDTO new];
    dto.name = self.name;
    dto.kkal = self.kkal;
    dto.protein = self.protein;
    dto.fat = self.fat;
    dto.carbonhydrate = self.carbonhydrate;
    dto.weight = self.weight;
    return dto;
}

@end
