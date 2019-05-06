//
//  MainMenuCellViewModel.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainMenuCellViewModel : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subtitle;
@property (strong, nonatomic) NSData *imageData;
@property (assign, nonatomic) BOOL needActivity;

@end

NS_ASSUME_NONNULL_END
