//
//  MainMenuCellViewModel.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "MainMenuCellViewModel.h"

@implementation MainMenuCellViewModel

- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle needActivity:(BOOL)needActivity color:(UIColor *)color
{
    self = [super init];
    if (self) {
        _title = title;
        _subtitle = subtitle;
        _needActivity = needActivity;
        _color = color;
    }
    return self;
}

@end
