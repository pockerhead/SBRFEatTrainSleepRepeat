//
//  TabBarAssembly.m
//  EatTrainSleepRepeat
//
//  Created pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//  Template generated by Balashov Artem @pockerhead
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TabBarAssembly.h"
#import "TabBarViewController.h"
#import "TabBarPresenter.h"
#import "TabBarProtocols.h"
#import "TabBarRouter.h"

@interface TabBarAssembly ()

@end

@implementation TabBarAssembly

+ (UIViewController *)createModule {
    TabBarViewController *view = [[TabBarViewController alloc] init];
    TabBarRouter *router = [[TabBarRouter alloc] init];
    TabBarPresenter *presenter = [[TabBarPresenter alloc] initWithView:view router:router];
    view.presenter = presenter;
    router.viewController = view;
    return view;
}

@end
