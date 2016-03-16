//
//  BHBPopView.m
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/14.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#import "BHBPopView.h"
#import "UIImage+BHBEffects.h"
#import "UIView+BHBAnimation.h"
#import "UIImageView+BHBSetImage.h"
#import "BHBPlaySoundTool.h"
#import "BHBBottomBar.h"
#import "BHBCustomBtn.h"
#import "UIButton+BHBSetImage.h"
#import "BHBCenterView.h"


@interface BHBPopView ()<BHBCenterViewDelegate,BHBCenterViewDataSource>

@property (nonatomic,weak) UIImageView * background;
@property (nonatomic,weak) UIImageView * logo;
@property (nonatomic,weak) BHBBottomBar * bottomBar;
@property (nonatomic,weak) BHBCenterView * centerView;

@property (nonatomic,strong) NSArray * items;
@property (nonatomic,copy) DidSelectItemBlock selectBlock;


@end

@implementation BHBPopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView * iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:iv];
        self.background = iv;
        UIImageView * logo = [[UIImageView alloc]init];
        [logo bhb_setImageWithResourcePath:@"images.bundle/compose_slogan" AutoSize:YES];
        logo.center = CGPointMake(frame.size.width / 2, frame.size.height * 0.2);
        [self addSubview:logo];
        self.logo = logo;
        BHBBottomBar * bar = [[BHBBottomBar alloc]initWithFrame:CGRectMake(0, frame.size.height - BHBBOTTOMHEIGHT, frame.size.width, BHBBOTTOMHEIGHT)];
        __weak typeof(self) weakSelf = self;
        bar.backClick = ^{
            [weakSelf.centerView scrollBack];
        };
        bar.closeClick = ^{
            [[BHBPlaySoundTool sharedPlaySoundTool] playWithSoundName:@"close"];
            [weakSelf hideItems];
            [weakSelf hide];
        };
        [self addSubview:bar];
        self.bottomBar = bar;
        BHBCenterView * centerView = [[BHBCenterView alloc]initWithFrame:CGRectMake(0, self.frame.size.height * 0.37, self.frame.size.width, self.frame.size.height * 0.4)];
        [self addSubview:centerView];
        centerView.delegate = self;
        centerView.dataSource = self;
        centerView.clipsToBounds = NO;
        self.centerView = centerView;
        
    }
    return self;
}

- (void)removeitemsComplete{
    self.superview.userInteractionEnabled = YES;
}


- (void)showItems{
    [self.centerView reloadData];
}

- (void)hideItems{
    [self.centerView dismis];
}


+ (BHB_INSTANCETYPE)showToView:(UIView *)view withItems:(NSArray *)array andSelectBlock:(DidSelectItemBlock)block{
    [[BHBPlaySoundTool sharedPlaySoundTool] playWithSoundName:@"open"];
    [self viewNotEmpty:view];
    BHBPopView * popView = [[BHBPopView alloc]initWithFrame:view.bounds];
    popView.background.image = [self imageWithView:view];
    [view addSubview:popView];
    popView.selectBlock = block;
    [popView fadeInWithTime:0.25];
    popView.items = array;
    [popView showItems];
    return popView;
}

+ (BHB_INSTANCETYPE)showToView:(UIView *)view andImages:(NSArray *)imageArray andTitles:(NSArray *)titles andSelectBlock:(DidSelectItemBlock)block{
    NSUInteger count = imageArray.count;
    NSMutableArray * items = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        BHBItem * item = [[BHBItem alloc]initWithTitle:titles[i] Icon:imageArray[i]];
        [items addObject:item];
    }
    return [self showToView:view withItems:items andSelectBlock:block];
}

+ (UIImage *)imageWithView:(UIView *)view{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(view.frame.size.width, view.frame.size.height), NO, [[UIScreen mainScreen] scale]);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIColor *tintColor = [UIColor colorWithWhite:0.95 alpha:0.78];
    image = [image bhb_applyBlurWithRadius:15 tintColor:tintColor saturationDeltaFactor:1 maskImage:nil];
    UIGraphicsEndImageContext();
    
    return image;
}

+ (void)viewNotEmpty:(UIView *)view{
    if (view == nil) {
        view = (UIView *)[[UIApplication sharedApplication] delegate];
    }

}

+ (void)hideFromView:(UIView *)view{
    [self viewNotEmpty:view];
    [view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIView * subV = (UIView *)obj;
        [subV isKindOfClass:[self class]];
        [BHBPopView hideWithView:subV];
    }];
}

- (void)hide{
    [BHBPopView hideWithView:self];
}

+ (void)hideWithView:(UIView *)view{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [view fadeOutWithTime:0.35];
    });
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[BHBPlaySoundTool sharedPlaySoundTool] playWithSoundName:@"close"];
    [self.bottomBar btnResetPosition];
    [self.bottomBar fadeOutWithTime:.25];
    [self hideItems];
    [self hide];
}

#pragma mark centerview delegate and datasource
- (NSInteger)numberOfItemsWithCenterView:(BHBCenterView *)centerView
{
    return self.items.count;
}

-(BHBItem *)itemWithCenterView:(BHBCenterView *)centerView item:(NSInteger)item
{
    return self.items[item];
}

-(void)didSelectItemWithCenterView:(BHBCenterView *)centerView andItem:(BHBItem *)item
{
    if (self.selectBlock) {
        self.selectBlock(item);
    }
    [[BHBPlaySoundTool sharedPlaySoundTool] playWithSoundName:@"open"];
    [self hide];
}

- (void)didSelectMoreWithCenterView:(BHBCenterView *)centerView andItem:(BHBGroup *)group
{
    if (self.selectBlock) {
        self.selectBlock(group);
    }
    [[BHBPlaySoundTool sharedPlaySoundTool] playWithSoundName:@"open"];
    self.bottomBar.isMoreBar = YES;
}

- (void)dealloc{
    NSLog(@"BHBPopView");
}

@end
