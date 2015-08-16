//
//  BHBCenterView.m
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/15.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#import "BHBCenterView.h"
#import "BHBCustomBtn.h"
#import "UIButton+BHBSetImage.h"
#import "BHBItem.h"
#import "UIView+BHBAnimation.h"

@interface BHBCenterView ()

@property (nonatomic,strong) NSMutableArray * visableArray;
@property (nonatomic,strong) NSMutableArray * itemsArray;
@property (nonatomic,weak) BHBCustomBtn * moreBtn;
@property (nonatomic,assign) BOOL btnCanceled;

@end

@implementation BHBCenterView
@dynamic delegate;

-(NSMutableArray *)itemsArray
{
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray array];
    }
    return _itemsArray;
}

-(NSMutableArray *)visableArray
{
    if (!_visableArray) {
        _visableArray = [NSMutableArray array];
    }
    return _visableArray;
}

- (void)reloadData{
//    NSAssert(self.delegate, @"BHBCenterView`s delegate was nil.");
    NSAssert(self.dataSource, @"BHBCenterView`s dataSource was nil.");
    NSAssert([self.dataSource respondsToSelector:@selector(numberOfItemsWithCenterView:)], @"BHBCenterView`s was unimplementation numberOfItemsWithCenterView:.");
    NSAssert([self.dataSource respondsToSelector:@selector(itemWithCenterView:item:)], @"BHBCenterView`s was unimplementation itemWithCenterView:item:.");
    [self.itemsArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.itemsArray removeAllObjects];
    [self.visableArray removeAllObjects];
    NSUInteger count = [self.dataSource numberOfItemsWithCenterView:self];
    BHBItem * item;
    for (int i = 0; i < count; i ++) {
        item = [self.dataSource itemWithCenterView:self item:i];
        BHBCustomBtn * btn = [BHBCustomBtn buttonWithType:UIButtonTypeCustom];
        [btn bhb_setImage:[NSString stringWithFormat:@"%@",item.icon]];
        [btn.imageView setContentMode:UIViewContentModeCenter];
        [btn setTitle:item.title forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        CGFloat x = (i % 3) * self.frame.size.width / 3.0;
        CGFloat y = (i / 3) * self.frame.size.height / 2.0;
        if (i >= 6) {
            x += [UIScreen mainScreen].bounds.size.width;
            y -= self.frame.size.height;
        }
        CGFloat width = self.frame.size.width / 3.0;
        CGFloat height = self.frame.size.height / 2;
        [self.itemsArray addObject:btn];
        if (item.isMore) {
            self.moreBtn = btn;
        }
        btn.tag = i;
        [btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn addTarget:self action:@selector(didTouchBtn:) forControlEvents:UIControlEventTouchDown];
        [btn addTarget:self action:@selector(didCancelBtn:) forControlEvents:UIControlEventTouchDragInside];
        [self addSubview:btn];
        btn.frame = CGRectMake(x, y, width, height);
    }
    [self btnPositonAnimation:NO];

    
}

- (void)didTouchBtn:(BHBCustomBtn *)btn{
    [btn scalingWithTime:.15 andscal:1.2];
}

- (void)didCancelBtn:(BHBCustomBtn *)btn{
    self.btnCanceled = YES;
    [btn scalingWithTime:.15 andscal:1];
}

- (void)scrollBack{
    [self.visableArray removeAllObjects];
    [self.itemsArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx < 6) {
            [self.visableArray addObject:obj];
        }
        else{
            *stop = YES;
        }
    }];
    [self setContentOffset:CGPointMake(0, 0) animated:YES];
}

- (void)didClickBtn:(BHBCustomBtn *)btn{
    if (self.btnCanceled) {
        self.btnCanceled = NO;
        return;
    }
    
    if (btn == self.moreBtn) {
        [btn scalingWithTime:.25 andscal:1];
        if (!self.delegate || ![self.delegate respondsToSelector:@selector(didSelectMoreWithCenterView:andItem:)]) {
            return;
        }
        [self.visableArray removeAllObjects];
        [self.itemsArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if (idx >= 6) {
                [self.visableArray addObject:obj];
            }
        }];
        [self setContentOffset:CGPointMake(self.frame.size.width, 0) animated:YES];
        [self.delegate didSelectMoreWithCenterView:self andItem:btn.tag];
        return;
    }
    else{
        [btn scalingWithTime:.25 andscal:1.7];
        [btn fadeOutWithTime:.25];
        [self.visableArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            BHBCustomBtn * b = obj;
            if (b != btn) {
                [b scalingWithTime:.25 andscal:0.3];
                [b fadeOutWithTime:.25];
            }
        }];
    }
    if (!self.delegate || ![self.delegate respondsToSelector:@selector(didSelectItemWithCenterView:andItem:)]) {
        return;
    }
    [self.delegate didSelectItemWithCenterView:self andItem:btn.tag];
}

- (void)dismis{
    [self btnPositonAnimation:YES];
}

- (void)removeAnimation{
    [self.visableArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        BHBCustomBtn * btn = obj;
        CGFloat x = btn.frame.origin.x;
        CGFloat y = btn.frame.origin.y;
        CGFloat width = btn.frame.size.width;
        CGFloat height = btn.frame.size.height;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((self.visableArray.count - idx) * 0.03 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:.5 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:5 options:0 animations:^{
                btn.alpha = 0;
                btn.frame = CGRectMake(x, [UIScreen mainScreen].bounds.size.height - self.frame.origin.y + y, width, height);
            } completion:^(BOOL finished) {
                if ([btn isEqual:[self.visableArray firstObject]]) {
                    self.superview.superview.userInteractionEnabled = YES;
                }
            }];
        });
        
    }];

}

- (void)moveInAnimation{
    
    [self.visableArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        BHBCustomBtn * btn = obj;
        CGFloat x = btn.frame.origin.x;
        CGFloat y = btn.frame.origin.y;
        CGFloat width = btn.frame.size.width;
        CGFloat height = btn.frame.size.height;
        btn.frame = CGRectMake(x, [UIScreen mainScreen].bounds.size.height + y - self.frame.origin.y, width, height);
        btn.alpha = 0.0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(idx * 0.03 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.35 delay:0 usingSpringWithDamping:0.85 initialSpringVelocity:25 options:UIViewAnimationOptionCurveEaseIn animations:^{
                btn.alpha = 1;
                btn.frame = CGRectMake(x, y, width, height);
            } completion:^(BOOL finished) {
                if ([btn isEqual:[self.visableArray lastObject]]) {
                    self.superview.superview.userInteractionEnabled = YES;
                }
            }];
        });
        
    }];
}

- (void)btnPositonAnimation:(BOOL)isDismis{
    if (self.visableArray.count <= 0) {
        [self.itemsArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if (idx >= 6) {
                *stop = YES;
                return ;
            }
            [self.visableArray addObject:obj];
        }];
    }
    self.superview.superview.userInteractionEnabled = NO;
    if (isDismis) {
        [self removeAnimation];
    }else{
        [self moveInAnimation];
    }
    
}

@end
