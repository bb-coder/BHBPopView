//
//  BHBCustomBtn.m
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/15.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#import "BHBCustomBtn.h"

@implementation BHBCustomBtn


- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGRect rect = CGRectMake(0, (contentRect.size.height - ICONHEIGHT - TITLEHEIGHT) / 2, contentRect.size.width, ICONHEIGHT);
    return rect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect rect = CGRectMake(0, (contentRect.size.height - ICONHEIGHT - TITLEHEIGHT) / 2 + ICONHEIGHT, contentRect.size.width, TITLEHEIGHT);
    return rect;
}

-(void)setHighlighted:(BOOL)highlighted
{
    
}

- (void)dealloc{
    NSLog(@"BHBCustomBtn");
}

@end
