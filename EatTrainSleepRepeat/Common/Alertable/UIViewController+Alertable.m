//
//  UIViewController+Alertable.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 18/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "UIViewController+Alertable.h"

@implementation UIViewController (Alertable)

- (void)displayAlertWithMessage:(nonnull NSString *)message completion:(nullable void(^)(void))handler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (handler)
        {
            handler();
        }
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)displayAlertWithMessage:(nullable NSString *)message title:(nullable NSString *)title cancelButtonTitle:(nullable NSString *)cancelButtonTitle okButtonTitle:(nullable NSString *)okButtonTitle okHandler:(void(^)(void))okHandler cancelHandler:(nullable void(^)(void))cancelHandler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelHandler();
    }];
    [alert addAction:action];
    if (okHandler)
    {
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:okButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            okHandler();
        }];
        [alert addAction:okAction];
    }
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)displayAlertWithMessage:(nullable NSString *)message title:(nullable NSString *)title textFieldPlaceholder:(nullable NSString *)placeholder cancelButtonTitle:(nullable NSString *)cancelButtonTitle okButtonTitle:(nonnull NSString *)okButtonTitle okHandler:(void(^)(NSString *))okHandler cancelHandler:(nullable void(^)(void))cancelHandler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelHandler();
    }];
    [alert addAction:action];
    UITextField *textField;
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholder;
    }];
    if (okHandler)
    {
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:okButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            okHandler(textField.text);
        }];
        [alert addAction:okAction];
    }
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
