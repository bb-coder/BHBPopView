//
//  ViewController.m
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/14.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#import "ViewController.h"
#import "BHBPopView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加背景图
    [self addBackImage];
}

/**
 *  添加背景图
 */
- (void)addBackImage{
    UIImageView * backImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    backImageView.image = [UIImage imageNamed:@"backgroundImage"];
    [self.view addSubview:backImageView];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    BHBItem * item0 = [[BHBItem alloc]initWithTitle:@"Text" Icon:@"images.bundle/tabbar_compose_idea"];
    BHBItem * item1 = [[BHBItem alloc]initWithTitle:@"Albums" Icon:@"images.bundle/tabbar_compose_photo"];
    BHBItem * item2 = [[BHBItem alloc]initWithTitle:@"Camera" Icon:@"images.bundle/tabbar_compose_camera"];
    BHBItem * item3 = [[BHBItem alloc]initWithTitle:@"Check in" Icon:@"images.bundle/tabbar_compose_lbs"];
    BHBItem * item4 = [[BHBItem alloc]initWithTitle:@"Review" Icon:@"images.bundle/tabbar_compose_review"];
//    item4.isMore = YES;
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
    
    //添加popview
//    [BHBPopView showToView:self.view andImages:@[@"images.bundle/tabbar_compose_idea",@"images.bundle/tabbar_compose_photo",@"images.bundle/tabbar_compose_camera",@"images.bundle/tabbar_compose_lbs",@"images.bundle/tabbar_compose_review",@"images.bundle/tabbar_compose_more"] andTitles:@[@"Text",@"Albums",@"Camera",@"Check in",@"Review",@"More"] andSelectBlock:^(BHBItem *item, NSInteger index) {
//        
//    }];
}

@end
