//
//  TabBarProtocols.h
//  EatTrainSleepRepeat
//
//  Created pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//  Template generated by Balashov Artem @pockerhead
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//Router implement navigateTo func
@protocol TabBarWireframeInterface <NSObject>

//example
@required - (void)navigateToDismiss;

@end

@protocol TabBarView <NSObject>

- (void)configureInitialVCs:(BOOL)auth;

@end

@protocol TabBarPresenterInterface <NSObject>

- (void)viewDidLoad;
- (void)viewWillAppear;
- (void)viewDidAppear;
- (void)viewWillDissappear;
- (void)viewDidDissappear;

@end


NS_ASSUME_NONNULL_END
