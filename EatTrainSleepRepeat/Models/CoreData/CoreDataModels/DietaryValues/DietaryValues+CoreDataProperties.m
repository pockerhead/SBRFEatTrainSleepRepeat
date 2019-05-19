//
//  DietaryValues+CoreDataProperties.m
//  
//
//  Created by pockerhead on 19/05/2019.
//
//

#import "DietaryValues+CoreDataProperties.h"

@implementation DietaryValues (CoreDataProperties)

+ (NSFetchRequest<DietaryValues *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"DietaryValues"];
}

@dynamic callories;
@dynamic carbonhydrates;
@dynamic date;
@dynamic proteins;
@dynamic totalFats;

@end
