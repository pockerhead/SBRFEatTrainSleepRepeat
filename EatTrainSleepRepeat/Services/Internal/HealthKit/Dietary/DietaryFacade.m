//
//  DietaryFacade.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 07/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "DietaryFacade.h"
#import "HealthService.h"

@implementation DietaryFacade

- (void)updateValuesWithCompletion:(void (^)(void))completion
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    [[HealthService sharedInstance] getDailyValueForQuantityType:HKQuantityTypeIdentifierDietaryEnergyConsumed completion:^(NSNumber * _Nullable value, NSError * _Nullable error) {
        if (value) {
            self.caloriesValue = value;
        }
        dispatch_group_leave(group);
    }];
    dispatch_group_enter(group);
    [[HealthService sharedInstance] getDailyValueForQuantityType:HKQuantityTypeIdentifierDietaryProtein completion:^(NSNumber * _Nullable value, NSError * _Nullable error) {
        if (value) {
            self.proteinsValue = value;
        }
        dispatch_group_leave(group);
    }];
    dispatch_group_enter(group);
    [[HealthService sharedInstance] getDailyValueForQuantityType:HKQuantityTypeIdentifierDietaryFatTotal completion:^(NSNumber * _Nullable value, NSError * _Nullable error) {
        if (value) {
            self.fatsValue = value;
        }
        dispatch_group_leave(group);
    }];
    dispatch_group_enter(group);
    [[HealthService sharedInstance] getDailyValueForQuantityType:HKQuantityTypeIdentifierDietaryCarbohydrates completion:^(NSNumber * _Nullable value, NSError * _Nullable error) {
        if (value) {
            self.carbonhydratesValue = value;
        }
        dispatch_group_leave(group);
    }];
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        completion();
    });
    
}

- (NSString *)caloriesStringValue
{
    NSString *stringValue = @"-";
    if (self.caloriesValue) {
        stringValue = [NSString stringWithFormat:@"%ld", (long)[self.caloriesValue integerValue]];
    }
    return [NSString stringWithFormat: @"%@ кКал", stringValue];
}

- (NSString *)proteinsStringValue
{
    NSString *stringValue = @"-";
    if (self.proteinsValue) {
        stringValue = [NSString stringWithFormat:@"%0.2f", [self.proteinsValue floatValue]];
    }
    return [NSString stringWithFormat: @"%@ г.", stringValue];
}

- (NSString *)fatsStringValue
{
    NSString *stringValue = @"-";
    if (self.fatsValue) {
        stringValue = [NSString stringWithFormat:@"%0.2f", [self.fatsValue floatValue]];
    }
    return [NSString stringWithFormat: @"%@ г.", stringValue];
}

- (NSString *)carbonhydratesStringValue
{
    NSString *stringValue = @"-";
    if (self.carbonhydratesValue) {
        stringValue = [NSString stringWithFormat:@"%0.2f", [self.carbonhydratesValue floatValue]];
    }
    return [NSString stringWithFormat: @"%@ г.", stringValue];
}


@end
