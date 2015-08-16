//
//  BHBBottomBar.h
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/15.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#define BHBBOTTOMHEIGHT ((57.0 / 736.0) * [UIScreen mainScreen].bounds.size.height)

#import <UIKit/UIKit.h>

typedef void (^BackClick)();
typedef void (^CloseClick)();

@interface BHBBottomBar : UIView

@property (nonatomic,assign) BOOL isMoreBar;

@property (nonatomic,copy) BackClick backClick;

@property (nonatomic,copy) CloseClick closeClick;

//恢复按钮位置
- (void)btnResetPosition;

@end
