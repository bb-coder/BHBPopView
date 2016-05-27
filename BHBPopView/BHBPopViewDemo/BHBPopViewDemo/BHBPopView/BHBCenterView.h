//
//  BHBCenterView.h
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/15.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BHBGroup,BHBItem;
@class BHBCenterView;

@protocol BHBCenterViewDataSource <NSObject>
@required
- (NSInteger)numberOfItemsWithCenterView:(BHBCenterView *)centerView;
- (BHBItem *)itemWithCenterView:(BHBCenterView *)centerView item:(NSInteger)item;

@end

@protocol BHBCenterViewDelegate <NSObject,UIScrollViewDelegate>

@optional
- (void)didSelectItemWithCenterView:(BHBCenterView *)centerView andItem:(BHBItem *)item;
- (void)didSelectMoreWithCenterView:(BHBCenterView *)centerView andItem:(BHBGroup *)group;
@end

@interface BHBCenterView : UIScrollView

@property (nonatomic,weak) id<BHBCenterViewDataSource> dataSource;
@property (nonatomic,weak) id<BHBCenterViewDelegate> delegate;

- (void)reloadData;

- (void)scrollBack;

- (void)dismis;

@end

#define KBHBRemoveAnimationComplete @"removeAnimation"
