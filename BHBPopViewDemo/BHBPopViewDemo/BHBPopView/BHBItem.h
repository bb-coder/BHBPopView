//
//  BHBItem.h
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/16.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHBItem : NSObject

@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * icon;

-(instancetype)initWithTitle:(NSString *)title Icon:(NSString *)icon;

@end
