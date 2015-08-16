//
//  UIImageView+BHBSetImage.m
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/15.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#import "UIImageView+BHBSetImage.h"

@implementation UIImageView (BHBSetImage)

- (void)bhb_setImage:(UIImage *)image{
    self.image = image;
    self.frame = CGRectMake(0, 0, image.size.width, image.size.height);
}

- (void)bhb_setImageWithResourcePath:(NSString *)path AutoSize:(BOOL)isAuto{
    UIImage * image = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:path]];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height / 2 - 1, image.size.width / 2 - 1, image.size.height / 2 - 1, image.size.width / 2 - 1) resizingMode:UIImageResizingModeStretch];
    if (isAuto) {
        [self bhb_setImage:image];
    }else{
        [self setImage:image];
    }
}

@end
