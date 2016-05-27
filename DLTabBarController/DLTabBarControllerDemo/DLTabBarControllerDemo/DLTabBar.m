//
//  DLTabBar.m
//  DLTabBarControllerDemo
//
//  Created by FT_David on 16/5/27.
//  Copyright © 2016年 FT_David. All rights reserved.
//

#import "DLTabBar.h"
#import "UIView+Extension.h"
@interface DLTabBar()

@property (nonatomic, weak) UIButton *centerButton;

@end

@implementation DLTabBar

@dynamic delegate;


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
            UIButton *centerButton = [[UIButton alloc] init];
        [centerButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [centerButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [centerButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [centerButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        centerButton.size = centerButton.currentBackgroundImage.size;
        [centerButton addTarget:self action:@selector(centerButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:centerButton];
        self.centerButton = centerButton;
    }
    return self;
}


- (void)centerButtonAction
{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarDidClickAtCenterButton:)]) {
        [self.delegate tabBarDidClickAtCenterButton:self];
    }
}

- (void)layoutSubviews
{

    [super layoutSubviews];
    

    self.centerButton.centerX = self.width * 0.5;
    self.centerButton.centerY = self.height * 0.5;

    CGFloat tabbarButtonW = self.width / 5;
    CGFloat tabbarButtonIndex = 0;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
          
            child.width = tabbarButtonW;
          
            child.x = tabbarButtonIndex * tabbarButtonW;
    
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex++;
            }
        }
    }
}


@end
