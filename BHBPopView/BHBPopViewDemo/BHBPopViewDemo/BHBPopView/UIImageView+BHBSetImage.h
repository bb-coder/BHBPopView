//
//  UIImageView+BHBSetImage.h
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/15.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (BHBSetImage)

- (void)bhb_setImage:(UIImage *)image;

- (void)bhb_setImageWithResourcePath:(NSString *)path AutoSize:(BOOL)isAuto;


@end
