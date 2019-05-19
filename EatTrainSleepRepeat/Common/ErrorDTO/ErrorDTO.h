//
//  ErrorDTO.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 19/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ErrorDTO : NSObject

@property (strong, nonatomic, nullable) NSString *title;
@property (strong, nonatomic, nullable) NSString *message;

- (instancetype)initWithTitle:(nullable NSString *)title message:(nullable NSString *)message;

@end

NS_ASSUME_NONNULL_END
