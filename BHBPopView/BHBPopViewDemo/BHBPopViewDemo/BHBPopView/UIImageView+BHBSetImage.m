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
    NSString * filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:path];
    if([[UIDevice currentDevice].systemVersion doubleValue] < 8.0){
        filePath = [filePath stringByAppendingString:@"@2x"];
    }
    UIImage * image = [UIImage imageWithContentsOfFile:filePath];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height / 2 - 1, image.size.width / 2 - 1, image.size.height / 2 - 1, image.size.width / 2 - 1) resizingMode:UIImageResizingModeStretch];
    if (isAuto) {
        [self bhb_setImage:image];
    }else{
        [self setImage:image];
    }
}

@end
