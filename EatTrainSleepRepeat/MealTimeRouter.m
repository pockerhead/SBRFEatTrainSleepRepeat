//
//  MealTimeRouter.m
//  EatTrainSleepRepeat
//
//  Created pockerhead on 18/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//
//  Template generated by Balashov Artem @pockerhead
//

#import "MealTimeRouter.h"
#import "MealTimeProtocols.h"
#import "AddMealAssembly.h"


@implementation MealTimeRouter

- (void)navigateToDismiss
{
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)navigateToAddMealWithIndex:(NSUInteger)index
{
    UIViewController *addMeal = [AddMealAssembly createModuleWithIndex:index];
    [self navigateTo:addMeal];
}

- (void)navigateTo:(UIViewController *)viewController
{
    if([viewController isKindOfClass:[UINavigationController class]]){
        [self.viewController presentViewController:viewController animated:YES completion:nil];
    } else if ([viewController isKindOfClass:[UIViewController class]]) {
        if (self.viewController.navigationController){
            [self.viewController.navigationController pushViewController:viewController animated:YES];
        } else {
            [self.viewController presentViewController:viewController animated:YES completion:nil];
        }
    }
}

@end
