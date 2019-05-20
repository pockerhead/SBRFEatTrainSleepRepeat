//
//  ETSRTextFieldCellViewModel.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 20/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface ETSRTextFieldCellViewModel : NSObject

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *placeholder;
@property (nonatomic, copy, nullable) void (^textDidEntered)(NSString * _Nullable text);
@property (assign, nonatomic) UIKeyboardType keyboardType;

@end

NS_ASSUME_NONNULL_END
