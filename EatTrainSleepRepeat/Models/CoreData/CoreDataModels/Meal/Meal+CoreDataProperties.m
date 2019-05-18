//
//  Meal+CoreDataProperties.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//

#import "Meal+CoreDataProperties.h"

@implementation Meal (CoreDataProperties)

+ (NSFetchRequest<Meal *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Meal"];
}

@dynamic name;
@dynamic weight;
@dynamic kkal;
@dynamic protein;
@dynamic carbonhydrate;
@dynamic fat;

@end
