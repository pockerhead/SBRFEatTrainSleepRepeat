//
//  MainMenuCellViewModel.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainMenuCellViewModel : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subtitle;
@property (assign, nonatomic) BOOL needActivity;
@property (strong, nonatomic) UIColor *color;

- (instancetype)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle needActivity:(BOOL)needActivity color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
