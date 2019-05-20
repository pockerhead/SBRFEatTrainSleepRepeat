//
//  NetworkService.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "NetworkService.h"

@implementation NetworkService

+ (void)requestWithPath:(NSString *)path baseURL:(NSString *)baseURL completionDictionary:(void(^)(NSDictionary * _Nullable dict, NSError * _Nullable error))completion
{
    NSString *fullURLString = [NSString stringWithFormat: @"%@%@", baseURL, path];
    NSURL *fullURL = [NSURL URLWithString:fullURLString];
    if (fullURL == nil)
    {
        completion(nil, [NSError errorWithDomain:NSURLErrorDomain code:0 userInfo:nil]);
    }
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    [sharedSession dataTaskWithURL:fullURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil)
        {
            
        }
    }];
}

@end
