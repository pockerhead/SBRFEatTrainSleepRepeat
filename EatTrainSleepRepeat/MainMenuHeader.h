//
//  MainMenuHeader.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 09/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuHeaderViewModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface MainMenuHeader : UITableViewHeaderFooterView

- (void)configureWithViewModel:(MainMenuHeaderViewModel *)viewModel;
@property (nonatomic, copy, nullable) void (^tapAction)(void);

@end

NS_ASSUME_NONNULL_END
