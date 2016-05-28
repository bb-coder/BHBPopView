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

    pod 'BHBPopView'

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
        andSelectBlock:^(BHBItem *item) {
        
        }
    ];

###3.使用带more按钮滑动显示第二屏功能
     BHBItem * item0 = [[BHBItem alloc]initWithTitle:@"Text" Icon:@"images.bundle/tabbar_compose_idea"];
    BHBItem * item1 = [[BHBItem alloc]initWithTitle:@"Albums" Icon:@"images.bundle/tabbar_compose_photo"];
    BHBItem * item2 = [[BHBItem alloc]initWithTitle:@"Camera" Icon:@"images.bundle/tabbar_compose_camera"];
    //第4个按钮内部有一组
    BHBGroup * item3 = [[BHBGroup alloc]initWithTitle:@"Check in" Icon:@"images.bundle/tabbar_compose_lbs"];
    BHBItem * item31 = [[BHBItem alloc]initWithTitle:@"Friend Circle" Icon:@"images.bundle/tabbar_compose_friend"];
    BHBItem * item32 = [[BHBItem alloc]initWithTitle:@"Weibo Camera" Icon:@"images.bundle/tabbar_compose_wbcamera"];
    BHBItem * item33 = [[BHBItem alloc]initWithTitle:@"Music" Icon:@"images.bundle/tabbar_compose_music"];
    item3.items = @[item31,item32,item33];
    
    BHBItem * item4 = [[BHBItem alloc]initWithTitle:@"Review" Icon:@"images.bundle/tabbar_compose_review"];
    
    //第六个按钮内部有一组
    BHBGroup * item5 = [[BHBGroup alloc]initWithTitle:@"More" Icon:@"images.bundle/tabbar_compose_more"];
    BHBItem * item51 = [[BHBItem alloc]initWithTitle:@"Friend Circle" Icon:@"images.bundle/tabbar_compose_friend"];
    BHBItem * item52 = [[BHBItem alloc]initWithTitle:@"Weibo Camera" Icon:@"images.bundle/tabbar_compose_wbcamera"];
    BHBItem * item53 = [[BHBItem alloc]initWithTitle:@"Music" Icon:@"images.bundle/tabbar_compose_music"];
    BHBItem * item54 = [[BHBItem alloc]initWithTitle:@"Blog" Icon:@"images.bundle/tabbar_compose_weibo"];
    BHBItem * item55 = [[BHBItem alloc]initWithTitle:@"Collection" Icon:@"images.bundle/tabbar_compose_transfer"];
    BHBItem * item56 = [[BHBItem alloc]initWithTitle:@"Voice" Icon:@"images.bundle/tabbar_compose_voice"];
    item5.items = @[item51,item52,item53,item54,item55,item56];

    
    //添加popview
    [BHBPopView showToView:self.view.window withItems:@[item0,item1,item2,item3,item4,item5]andSelectBlock:^(BHBItem *item) {
        if ([item isKindOfClass:[BHBGroup class]]) {
            NSLog(@"选中%@分组",item.title);
        }else{
        NSLog(@"选中%@项",item.title);
        }
    }];
    
 
###4.使用参考
使用可参考LiQiankun贡献的DLTabBarController文件夹。
 
#缺陷:
1.按钮弹出的动画比新浪原版略显生硬。

#编写目的：
###仅供学习和交流，没有冒犯新浪大大的意思^_^。

#灵感：
##每次玩微博都强迫症作祟，跟个傻X一样不停的点这个，会不会有人跟我一样？😁
##对动画优化有建议的请issue我。
##没事跟我一样闲的蛋疼请issue我。

good luck!

##Update log  

###1.1版本更新:  
 - 优化弹出时间  
 - 优化内存问题  
 - 增加带层级关系的分组功能（替代原来的more方案）
 - 兼容iOS7真机找不到图片的问题
