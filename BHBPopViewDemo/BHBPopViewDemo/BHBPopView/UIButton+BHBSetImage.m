//
//  UIButton+BHBSetImage.m
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/15.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#import "UIButton+BHBSetImage.h"

@implementation UIButton (BHBSetImage)

- (void)bhb_setImage:(NSString *)imagePath{
    UIImage * image = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:imagePath]];
    [self setImage:image forState:UIControlStateNormal];
}

- (void)bhb_setBGImage:(NSString *)imagePath{
    UIImage * image = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:imagePath]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height / 2 - 1, image.size.width / 2 - 1, image.size.height / 2 - 1, image.size.width / 2 - 1) resizingMode:UIImageResizingModeStretch];
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

@end
