[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/bb-coder/BHBPopView/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/v/BHBPopView.svg?style=flat)](http://cocoapods.org/?q=BHBPopView)
[![CocoaPods](https://img.shields.io/cocoapods/p/BHBPopView.svg?style=flat)](http://cocoapods.org/?q=BHBPopView)
[![Support](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)

# BHBPopView
仿新浪微博客户端“加号”按钮弹出动画

![演示1](http://7xkdhe.com1.z0.glb.clouddn.com/sinaAnimation1.gif)
![演示2](http://7xkdhe.com1.z0.glb.clouddn.com/sinaAnimation2.gif)


##怎么使用：

###0.下载或者在cocoapods中引入：

    pod 'BHBPopView', '~> 1.0.0'

###1.导入头文件

    #import "BHBPopView.h"

###2.显示弹出框
    //添加popview
    [BHBPopView showToView:self.view 
        andImages:@[@"images.bundle/tabbar_compose_idea",
          @"images.bundle/tabbar_compose_photo",@"images.bundle/tabbar_compose_camera",
          @"images.bundle/tabbar_compose_lbs",@"images.bundle/tabbar_compose_review",
          @"images.bundle/tabbar_compose_more"] 
        andTitles:
          @[@"Text",@"Albums",@"Camera",@"Check in",@"Review",@"More"] 
        andSelectBlock:^(BHBItem *item, NSInteger index) {
        
        }
    ];

###3.使用带more按钮滑动显示第二屏功能
    BHBItem * item0 = [[BHBItem alloc]initWithTitle:@"Text" Icon:@"images.bundle/tabbar_compose_idea"];
    BHBItem * item1 = [[BHBItem alloc]initWithTitle:@"Albums" Icon:@"images.bundle/tabbar_compose_photo"];
    BHBItem * item2 = [[BHBItem alloc]initWithTitle:@"Camera" Icon:@"images.bundle/tabbar_compose_camera"];
    BHBItem * item3 = [[BHBItem alloc]initWithTitle:@"Check in" Icon:@"images.bundle/tabbar_compose_lbs"];
    BHBItem * item4 = [[BHBItem alloc]initWithTitle:@"Review" Icon:@"images.bundle/tabbar_compose_review"];
    BHBItem * item5 = [[BHBItem alloc]initWithTitle:@"More" Icon:@"images.bundle/tabbar_compose_more"];
    //第六个按钮是more按钮
    item5.isMore = YES;
    BHBItem * item6 = [[BHBItem alloc]initWithTitle:@"Friend Circle" Icon:@"images.bundle/tabbar_compose_friend"];
    BHBItem * item7 = [[BHBItem alloc]initWithTitle:@"Weibo Camera" Icon:@"images.bundle/tabbar_compose_wbcamera"];
    BHBItem * item8 = [[BHBItem alloc]initWithTitle:@"Music" Icon:@"images.bundle/tabbar_compose_music"];
    BHBItem * item9 = [[BHBItem alloc]initWithTitle:@"Blog" Icon:@"images.bundle/tabbar_compose_weibo"];
    BHBItem * item10 = [[BHBItem alloc]initWithTitle:@"Collection" Icon:@"images.bundle/tabbar_compose_transfer"];
    BHBItem * item11 = [[BHBItem alloc]initWithTitle:@"Voice" Icon:@"images.bundle/tabbar_compose_voice"];
    
    //添加popview
    [BHBPopView showToView:self.view withItems:@[item0,item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11]andSelectBlock:^(BHBItem *item, NSInteger index) {
        NSLog(@"%ld,选中%@",index,item.title);
    }];
    
    
#缺陷:
1.按钮弹出的动画比新浪原版略显生硬。

#编写目的：
###仅供学习和交流，没有冒犯新浪大大的意思^_^。

#灵感：
##每次玩微博都强迫症作祟，跟个傻X一样不停的点这个，会不会有人跟我一样？😁
##对动画优化有建议的请issue我。
##没事跟我一样闲的蛋疼请issue我。

good luck!
