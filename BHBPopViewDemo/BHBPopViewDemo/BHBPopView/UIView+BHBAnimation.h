//
//  UIView+BHBAnimation.h
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/15.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BHBAnimation)

//淡入
- (void)fadeInWithTime:(NSTimeInterval)time;
//淡出
- (void)fadeOutWithTime:(NSTimeInterval)time;
//缩放
- (void)scalingWithTime:(NSTimeInterval)time andscal:(CGFloat)scal;
//旋转
- (void)RevolvingWithTime:(NSTimeInterval)time andDelta:(CGFloat)delta;

@end
