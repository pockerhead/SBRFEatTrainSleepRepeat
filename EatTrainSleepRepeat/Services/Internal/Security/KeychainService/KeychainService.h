//
//  KeychainService.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 18/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * _Nonnull const authTokenKey = @"VKOAuthTokenKey";
static NSString * _Nonnull const userIDKey = @"VKuserIDKey";


@interface KeychainService : NSObject

+ (BOOL)saveObject:(id _Nonnull )object forKey:(NSString *_Nonnull)key;
+ (_Nullable id)loadObjectForKey:(NSString *_Nonnull)key;
+ (BOOL)deleteObjectForKey:(NSString *_Nonnull)key;

@end


