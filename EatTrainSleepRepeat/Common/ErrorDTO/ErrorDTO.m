//
//  ErrorDTO.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 19/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "ErrorDTO.h"

@implementation ErrorDTO

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message
{
    self = [super init];
    if (self)
    {
        _title = title;
        _message = message;
    }
    return self;
}

@end
