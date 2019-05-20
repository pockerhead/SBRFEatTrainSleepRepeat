//
//  Meal+CoreDataProperties.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//

#import "Meal+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Meal (CoreDataProperties)

+ (NSFetchRequest<Meal *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) float kkal;
@property (nonatomic) float weight;
@property (nonatomic) float protein;
@property (nonatomic) float carbonhydrate;
@property (nonatomic) float fat;

@end

NS_ASSUME_NONNULL_END
