//
//  BHBPopView.h
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/14.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#ifndef BHB_INSTANCETYPE
#if __has_feature(objc_instancetype)
#define BHB_INSTANCETYPE instancetype
#else
#define BHB_INSTANCETYPE id
#endif
#endif

#import <UIKit/UIKit.h>
#import "BHBGroup.h"

typedef void (^DidSelectItemBlock) (BHBItem * item);

@interface BHBPopView : UIView

/**
 *  直接显示一个popView在某个view上
 *
 *  @param view       父view
 *  @param imageArray 图标数组
 *  @param titles     标题数组
 *  @param block      回调
 *  @return pop视图
 */
+ (BHB_INSTANCETYPE)showToView:(UIView *)view andImages:(NSArray *)imageArray andTitles:(NSArray *)titles andSelectBlock:(DidSelectItemBlock)block;
/**
 *  如果显示一个带more功能的，请使用此方法
 *
 *  @param view  父view
 *  @param array BHBItem类型的集合
 *  @param block 回调
 *  @return pop视图
 */
+ (BHB_INSTANCETYPE)showToView:(UIView *)view withItems:(NSArray *)array andSelectBlock:(DidSelectItemBlock)block;

@end
