//
//  TabBarRouter.h
//  EatTrainSleepRepeat
//
//  Created pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//  Template generated by Balashov Artem @pockerhead
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TabBarProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface TabBarRouter : NSObject<TabBarWireframeInterface>

@property (weak, nonatomic) UIViewController *viewController;

@end

NS_ASSUME_NONNULL_END