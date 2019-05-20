//
//  CoreDataService.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataService : NSObject

@property (readonly, strong) NSPersistentContainer *persistentContainer;

+ (instancetype)shared;

- (void)saveContext;
- (void)performBackgroundTask:(void (^)(NSManagedObjectContext *))block completion:(void(^)(void))completion;

@end

NS_ASSUME_NONNULL_END
