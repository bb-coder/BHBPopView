//
//  BHBPlaySoundTool.m
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/15.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#import "BHBPlaySoundTool.h"

@implementation BHBSoundId

- (id)initForPlayingVibrate
{
    self = [super init];
    if (self) {
        _soundID = kSystemSoundID_Vibrate;
    }
    return self;
}

-(id)initForPlayingSystemSoundEffectWith:(NSString *)resourceName ofType:(NSString *)type
{
    self = [super init];
    if (self) {
        NSString *path = [[NSBundle bundleWithIdentifier:@"com.apple.UIKit"] pathForResource:resourceName ofType:type];
        if (path) {
            SystemSoundID theSoundID;
            OSStatus error =  AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &theSoundID);
            if (error == kAudioServicesNoError) {
                _soundID = theSoundID;
            }else {
                NSLog(@"Failed to create sound ");
            }
        }
        
    }
    return self;
}

-(id)initForPlayingSoundEffectWith:(NSString *)filename
{
    self = [super init];
    if (self) {
        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        if (fileURL != nil)
        {
            SystemSoundID theSoundID;
            OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileURL, &theSoundID);
            if (error == kAudioServicesNoError){
                _soundID = theSoundID;
            }else {
                NSLog(@"Failed to create sound ");
            }
        }
    }
    return self;
}

-(void)play
{
    AudioServicesPlaySystemSound(_soundID);
}

-(void)dealloc
{
    AudioServicesDisposeSystemSoundID(_soundID);
}


@end

@interface BHBPlaySoundTool ()

@property (nonatomic,strong) NSMutableDictionary * soundDictinary;

@end

@implementation BHBPlaySoundTool

BHBSingletonM(PlaySoundTool)

-(NSMutableDictionary *)soundDictinary
{
    if (!_soundDictinary) {
        _soundDictinary = [NSMutableDictionary dictionary];
        [self registerAllSoundId];
    }
    return _soundDictinary;
}

- (void)addSoundId:(BHBSoundId *)soundID WithName:(NSString *)name{
    [self.soundDictinary setObject:soundID forKey:name];
}

//初始化所有音效
- (void)registerAllSoundId{
    BHBSoundId * s1 = [[BHBSoundId alloc]initForPlayingSoundEffectWith:@"music.bundle/composer_open.wav"];
    [self.soundDictinary setObject:s1 forKey:@"open"];
    BHBSoundId * s2 = [[BHBSoundId alloc]initForPlayingSoundEffectWith:@"music.bundle/composer_close.wav"];
    [self.soundDictinary setObject:s2 forKey:@"close"];
}

- (BOOL)playWithSoundName:(NSString *)name{
    if (name && ![name isEqualToString:@""]) {
        BHBSoundId * soundId = [self.soundDictinary objectForKey:name];
        if (!soundId) {
            return NO;
        }
        else{
            [soundId play];
            return YES;
        }
    }
    return NO;
}

@end
