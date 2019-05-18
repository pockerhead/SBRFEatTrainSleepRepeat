//
//  MainMenuHeaderViewModel.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 09/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainMenuCellViewModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface MainMenuHeaderViewModel : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSData *icon;
@property (nonatomic, copy, nullable) void (^tapAction)(void);
@property (assign, nonatomic) BOOL isExpanded;

@end

NS_ASSUME_NONNULL_END
