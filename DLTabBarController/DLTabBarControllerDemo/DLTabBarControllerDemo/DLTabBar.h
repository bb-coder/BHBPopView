//
//  DLTabBar.h
//  DLTabBarControllerDemo
//
//  Created by FT_David on 16/5/27.
//  Copyright © 2016年 FT_David. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DLTabBar;

@protocol DLTabBarDelegate <NSObject>

/** 点击中间按钮的代理 */
-(void)tabBarDidClickAtCenterButton:(DLTabBar *)tabBar;

@end


@interface DLTabBar : UITabBar<UITabBarDelegate>

@property(nonatomic,weak)id<DLTabBarDelegate> delegate;

@end
