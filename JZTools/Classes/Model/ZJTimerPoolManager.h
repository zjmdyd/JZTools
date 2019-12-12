//
//  ZJTimerPoolManager.h
//  HeLiCommunity
//
//  Created by ZJ on 2019/8/17.
//  Copyright © 2019 HY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJTimerPoolManager : NSObject

+ (instancetype)shareManager;

- (void)addTimer:(NSTimer *)timer;
- (void)removeTimer:(NSTimer *)timer;
- (void)clearTimerPool;

@end

NS_ASSUME_NONNULL_END
