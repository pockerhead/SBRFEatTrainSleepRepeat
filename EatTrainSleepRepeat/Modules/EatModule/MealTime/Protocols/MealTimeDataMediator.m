//
//  MealTimeDataMediator.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 19/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "MealTimeDataMediator.h"

@implementation MealTimeDataMediator

- (id)copy
{
    MealTimeDataMediator *another = [MealTimeDataMediator new];
    another.sectionFooter = self.sectionFooter;
    another.sectionHeader = self.sectionHeader;
    another.rows = [NSArray arrayWithArray:self.rows];
    another.storedRows = [NSArray arrayWithArray:self.storedRows];
    another.isExpanded = self.isExpanded;
    return another;
}

@end
