//
//  BHBPlaySoundTool.h
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/15.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHBSingleton.h"
#import <AudioToolbox/AudioToolbox.h>

@interface BHBSoundId : NSObject
{
    SystemSoundID _soundID;
}

/**
 *  @brief  为播放震动效果初始化
 *
 *  @return self
 */
-(id)initForPlayingVibrate;

/**
 *  @brief  为播放系统音效初始化(无需提供音频文件)
 *
 *  @param resourceName 系统音效名称
 *  @param type 系统音效类型
 *
 *  @return self
 */
-(id)initForPlayingSystemSoundEffectWith:(NSString *)resourceName ofType:(NSString *)type;

/**
 *  @brief  为播放特定的音频文件初始化（需提供音频文件）
 *
 *  @param filename 音频文件名（加在工程中）
 *
 *  @return self
 */
-(id)initForPlayingSoundEffectWith:(NSString *)filename;

/**
 *  @brief  播放音效
 */
-(void)play;

@end

@interface BHBPlaySoundTool : NSObject

BHBSingletonH(PlaySoundTool)

/**
 *  添加一个音效
 *
 *  @param soundID 音效对象
 *  @param name    音效名字
 */
- (void)addSoundId:(BHBSoundId *)soundID WithName:(NSString *)name;

/**
 *  播放音效
 *
 *  @param name 音效名字
 *
 *  @return 播放是否成功
 */
- (BOOL)playWithSoundName:(NSString *)name;

/**
 *  初始化所有默认音效
 */
- (void)registerAllSoundId;

@end
