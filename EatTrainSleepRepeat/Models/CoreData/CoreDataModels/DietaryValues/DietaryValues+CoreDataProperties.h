//
//  DietaryValues+CoreDataProperties.h
//  
//
//  Created by pockerhead on 19/05/2019.
//
//

#import "DietaryValues+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DietaryValues (CoreDataProperties)

+ (NSFetchRequest<DietaryValues *> *)fetchRequest;

@property (nonatomic) double callories;
@property (nonatomic) double carbonhydrates;
@property (nullable, nonatomic, copy) NSDate *date;
@property (nonatomic) double proteins;
@property (nonatomic) double totalFats;

@end

NS_ASSUME_NONNULL_END
