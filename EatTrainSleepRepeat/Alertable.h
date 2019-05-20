//
//  Alertable.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 18/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Alertable <NSObject>

@required
- (void)displayAlertWithMessage:(nonnull NSString *)message completion:(nullable void(^)(void))handler;

@optional
- (void)displayAlertWithMessage:(nullable NSString *)message title:(nullable NSString *)title cancelButtonTitle:(nullable NSString *)cancelButtonTitle okButtonTitle:(nullable NSString *)okButtonTitle okHandler:(void(^)(void))okHandler cancelHandler:(nullable void(^)(void))cancelHandler;
- (void)displayAlertWithMessage:(nullable NSString *)message title:(nullable NSString *)title textFieldPlaceholder:(nullable NSString *)placeholder cancelButtonTitle:(nullable NSString *)cancelButtonTitle okButtonTitle:(nonnull NSString *)okButtonTitle okHandler:(void(^)(NSString *))okHandler cancelHandler:(nullable void(^)(void))cancelHandler;

@end

NS_ASSUME_NONNULL_END
