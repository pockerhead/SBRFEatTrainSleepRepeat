//
//  UIView+Constratints.h
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Constraints)

- (void)fillSuperview;
- (void)anchorCenterXToSuperview;
- (void)anchorCenterYToSuperview;

@end

NS_ASSUME_NONNULL_END
