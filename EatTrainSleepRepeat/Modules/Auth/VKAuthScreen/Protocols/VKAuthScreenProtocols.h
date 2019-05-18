//
//  VKAuthScreenProtocols.h
//  EatTrainSleepRepeat
//
//  Created pockerhead on 18/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//  Template generated by Balashov Artem @pockerhead
//

#import <Foundation/Foundation.h>
#import "Alertable.h"

NS_ASSUME_NONNULL_BEGIN

//Router implement navigateTo func
@protocol VKAuthScreenWireframeInterface <NSObject>

//example
@required - (void)navigateToDismiss;

@end

@protocol VKAuthScreenView <NSObject, Alertable>

- (void)displayURL:(NSURL *)url;

@end

@protocol VKAuthScreenPresenterInterface <NSObject>

- (void)viewDidLoad;
- (void)viewWillAppear;
- (void)viewDidAppear;
- (void)viewWillDissappear;
- (void)viewDidDissappear;

- (void)didFinishLoadWithURL:(NSURL *)url;
- (void)didSelectDismissButton;

@end


NS_ASSUME_NONNULL_END