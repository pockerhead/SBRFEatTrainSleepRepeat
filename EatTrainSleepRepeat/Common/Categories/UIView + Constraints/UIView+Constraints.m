//
//  UIView+Constratints.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 21/04/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "UIView+Constraints.h"

@implementation UIView (Constraints)

- (void)fillSuperview
{
    if (self.superview == nil)
    {
        return;
    }
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
                                               [self.topAnchor constraintEqualToAnchor:self.superview.topAnchor constant:0],
                                               [self.bottomAnchor constraintEqualToAnchor:self.superview.bottomAnchor constant:0],
                                               [self.leftAnchor constraintEqualToAnchor:self.superview.leftAnchor constant:0],
                                               [self.rightAnchor constraintEqualToAnchor:self.superview.rightAnchor constant:0]
                                               ]];
}

- (void)anchorCenterXToSuperview
{
    if (self.superview == nil)
    {
        return;
    }
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.centerXAnchor constraintEqualToAnchor:self.superview.centerXAnchor]
                                              ]];
}

- (void)anchorCenterYToSuperview
{
    if (self.superview == nil)
    {
        return;
    }
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
                                              [self.centerYAnchor constraintEqualToAnchor:self.superview.centerYAnchor]
                                              ]];
}

@end
