//
//  MainMenuDataMediator.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 09/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainMenuHeaderViewModel.h"
#import "MainMenuCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainMenuDataMediator : NSObject

@property (strong, nonatomic) MainMenuHeaderViewModel *sectionHeader;
@property (strong, nonatomic) NSArray <MainMenuCellViewModel *> *rows;
@property (assign, nonatomic) BOOL isExpanded;

@end

NS_ASSUME_NONNULL_END
