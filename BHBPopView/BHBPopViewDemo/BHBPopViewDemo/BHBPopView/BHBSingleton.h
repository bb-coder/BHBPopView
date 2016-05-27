//
//  BHBSingleton.h
//  BHBPopViewDemo
//
//  Created by 毕洪博 on 15/8/15.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

#ifndef BHBPopViewDemo_BHBSingleton_h
#define BHBPopViewDemo_BHBSingleton_h

#define BHBSingletonH(methodName) + (instancetype)shared##methodName;
#if __has_feature(objc_arc) // 是ARC
#define BHBSingletonM(methodName) \
static id instace = nil; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
    if (instace == nil) { \
        static dispatch_once_t onceToken; \
        dispatch_once(&onceToken, ^{ \
            instace = [super allocWithZone:zone]; \
        }); \
    } \
    return instace; \
} \
\
- (id)init \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        instace = [super init]; \
    }); \
    return instace; \
} \
\
+ (instancetype)shared##methodName \
{ \
    return [[self alloc] init]; \
} \
- (id)copyWithZone:(struct _NSZone *)zone \
{ \
    return instace; \
} \
\
- (id)mutableCopyWithZone:(struct _NSZone *)zone{\
    return instace;\
}
#else // 不是ARC
#define BHBSingletonM(methodName) \
static id instace = nil; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
    if (instace == nil) { \
        static dispatch_once_t onceToken; \
        dispatch_once(&onceToken, ^{ \
            instace = [super allocWithZone:zone]; \
        }); \
    } \
    return instace; \
} \
\
- (id)init \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        instace = [super init]; \
    }); \
    return instace; \
} \
\
+ (instancetype)shared##methodName \
{ \
    return [[self alloc] init]; \
} \
\
+ (oneway void)release \
{ \
    \
} \
\
- (id)retain \
{ \
    return self; \
} \
\
- (NSUInteger)retainCount \
{ \
    return 1; \
} \
- (id)copyWithZone:(struct _NSZone *)zone \
{ \
    return instace; \
} \
- (id)mutableCopyWithZone:(struct _NSZone *)zone \
{ \
    return instace; \ 
}
#endif


#endif
