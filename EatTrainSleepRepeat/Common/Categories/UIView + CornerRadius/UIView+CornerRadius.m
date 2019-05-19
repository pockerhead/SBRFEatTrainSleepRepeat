//
//  UIView+CornerRadius.m
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 19/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "UIView+CornerRadius.h"

@implementation UIView (CornerRadius)

- (void)cornerRadiusWithCorners:(UIRectCorner)corners radius:(CGFloat)radius
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:[self bounds] byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *mask = [CAShapeLayer new];
    mask.path = path.CGPath;
    self.layer.mask = mask;
}

@end
