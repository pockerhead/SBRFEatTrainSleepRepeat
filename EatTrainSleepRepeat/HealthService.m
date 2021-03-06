//
//  HealthService.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 06/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "HealthService.h"
#import "DateService.h"

@interface HealthService ()

@property (strong, nonatomic) HKHealthStore *store;

@end

@implementation HealthService


- (void)setup
{
    if ([HKHealthStore isHealthDataAvailable])
    {
        NSSet<HKSampleType *>* allTypes = [[NSSet alloc] initWithObjects:[HKObjectType workoutType],
                                           [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned],
                                           [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning],
                                           [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],
                                           [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight],
                                           [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass],
                                           [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryProtein],
                                           [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatTotal],
                                           [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCarbohydrates],
                                           [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryEnergyConsumed],
                                           [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBasalEnergyBurned],
                                           [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned],
                                           nil];
        [self.store requestAuthorizationToShareTypes:allTypes readTypes:allTypes completion:^(BOOL success, NSError * _Nullable error) {
            if (error)
            {
                NSLog(@"%@", [error localizedDescription]);
            }
            if (!success)
            {
                NSLog(@"error");
            }
        }];
    }
}

+ (instancetype)sharedInstance {
    static HealthService *sharedInstance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] initPrivate];
    });
    return sharedInstance;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"..." userInfo:nil];
}

- (instancetype)initPrivate {
    if (self = [super init]) {
        _store = [HKHealthStore new];
    }
    return self;
}

- (void)getDailySamplesForQuantityType:(HKQuantityTypeIdentifier)type completion:(void(^)(NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error))completion
{
    DateService *dateService = [DateService new];
    NSDate *startDate = [dateService getStartOfDayForDate:[NSDate new]];
    NSDate *endDate = [dateService getEndOfDayForDate:[NSDate new]];
    HKSampleType *sample = [HKSampleType quantityTypeForIdentifier:type];
    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate
                                                               endDate:endDate
                                                               options:HKQueryOptionStrictStartDate];
    HKSampleQuery *query = [[HKSampleQuery alloc] initWithSampleType:sample predicate:predicate limit:0 sortDescriptors:nil resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error)
            {
                NSLog(@"%@", error.localizedDescription);
                completion(nil, error);
            }
            else
            {
                if ([self unitForType:type] == nil)
                {
                    completion(nil, [NSError errorWithDomain:HKErrorDomain code:-300 userInfo:nil]);
                    return;
                }
                completion(results, nil);
            }
        });
    }];
    [self.store executeQuery:query];
}

- (void)getDailyValueForQuantityType:(HKQuantityTypeIdentifier)type completion:(void(^)(NSNumber * _Nullable value, NSError * _Nullable error))completion
{
    __block float dailyValue = 0;
    [self getDailySamplesForQuantityType:type completion:^(NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        for(HKQuantitySample *samples in results)
        {
            dailyValue += [[samples quantity] doubleValueForUnit:[self unitForType:type]];
        }
        
        completion(@(dailyValue), nil);
    }];
}

- (void)storeDailyValueForQuantityType:(HKQuantityTypeIdentifier)type value:(NSNumber *)value completion:(void (^_Nullable)(BOOL success, NSError * _Nullable error))completion
{
    DateService *dateService = [DateService new];
    NSDate *startDate = [dateService getStartOfDayForDate:[NSDate new]];
    NSDate *endDate = [dateService getEndOfDayForDate:[NSDate new]];
    HKQuantity *quantity = [HKQuantity quantityWithUnit:[self unitForType:type] doubleValue:[value doubleValue]];
    HKQuantityType *qType = [HKQuantityType quantityTypeForIdentifier:type];
    HKQuantitySample *qSample = [HKQuantitySample quantitySampleWithType:qType quantity:quantity startDate:startDate endDate:endDate];
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    [self getDailySamplesForQuantityType:type completion:^(NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        for(HKQuantitySample *sample in results)
        {
            [self.store deleteObject:sample withCompletion:^(BOOL success, NSError * _Nullable error) {
                
            }];
        }
        dispatch_group_leave(group);
    }];
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [self.store saveObject:qSample withCompletion:^(BOOL success, NSError * _Nullable error) {
            if (completion)
            {
                completion(success, error);
            }
        }];
    });
}

- (HKUnit *)unitForType:(HKQuantityTypeIdentifier)type
{
    if (type == HKQuantityTypeIdentifierStepCount)
    {
        return [HKUnit countUnit];
    }
    else if (type == HKQuantityTypeIdentifierDietaryEnergyConsumed || type == HKQuantityTypeIdentifierBasalEnergyBurned || type == HKQuantityTypeIdentifierActiveEnergyBurned)
    {
        return [HKUnit kilocalorieUnit];
    }
    else if (type == HKQuantityTypeIdentifierDietaryFatTotal || type == HKQuantityTypeIdentifierDietaryProtein || type == HKQuantityTypeIdentifierDietaryCarbohydrates)
    {
        return [HKUnit gramUnit];
    }
    else if (type == HKQuantityTypeIdentifierDistanceWalkingRunning)
    {
        return [HKUnit meterUnit];
    }
    return nil;
}

@end
