//
//  BHBItem.m
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/16.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#import "BHBItem.h"

@implementation BHBItem

-(instancetype)initWithTitle:(NSString *)title Icon:(NSString *)icon{
    self = [super init];
    if (self) {
        self.title = title;
        self.icon = icon;
    }
    return self;
}

- (void)dealloc{
    NSLog(@"BHBItem");
}

@end
