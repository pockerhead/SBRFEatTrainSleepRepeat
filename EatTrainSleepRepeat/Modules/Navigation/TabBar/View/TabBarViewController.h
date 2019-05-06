//
//  TabBarViewController.h
//  EatTrainSleepRepeat
//
//  Created pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//  Template generated by Balashov Artem @pockerhead
//

#import <UIKit/UIKit.h>
#import "TabBarProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface TabBarViewController : UITabBarController<TabBarView>

@property (nonatomic, strong) NSObject<TabBarPresenterInterface>* presenter;

@end

NS_ASSUME_NONNULL_END