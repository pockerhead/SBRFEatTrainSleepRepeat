//
//  MainMenuRouter.m
//  EatTrainSleepRepeat
//
//  Created pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//  Template generated by Balashov Artem @pockerhead
//

#import "MainMenuRouter.h"
#import "MainMenuProtocols.h"
#import "VKAuthScreenAssembly.h"
#import "MealTimeAssembly.h"

@implementation MainMenuRouter

- (void)navigateToDismiss { 
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)navigateToAuth {
    UIViewController *authScreen = [VKAuthScreenAssembly createModule];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:authScreen];
    [self navigateTo:nav];
}

- (void)navigateToMealTime
{
    UIViewController *mealTime = [MealTimeAssembly createModule];
    [self navigateTo:mealTime];
}


- (void)navigateTo:(UIViewController *)vc {
    if([vc isKindOfClass:[UINavigationController class]]){
        [self.viewController presentViewController:vc animated:YES completion:nil];
    } else if ([vc isKindOfClass:[UIViewController class]]) {
        if (self.viewController.navigationController){
            [self.viewController.navigationController pushViewController:vc animated:YES];
        } else {
            [self.viewController presentViewController:vc animated:YES completion:nil];
        }
    }
}

@end
