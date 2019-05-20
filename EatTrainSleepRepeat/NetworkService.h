//
//  NetworkService.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkService : NSObject

+ (void)requestWithPath:(NSString *)path baseURL:(NSString *)baseURL completionDictionary:(void(^)(NSDictionary * _Nullable dict, NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
