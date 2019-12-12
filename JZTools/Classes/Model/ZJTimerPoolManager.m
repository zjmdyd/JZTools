//
//  ZJTimerPoolManager.m
//  HeLiCommunity
//
//  Created by ZJ on 2019/8/17.
//  Copyright © 2019 HY. All rights reserved.
//

#import "ZJTimerPoolManager.h"

static ZJTimerPoolManager *_manager = nil;

@interface ZJTimerPoolManager ()

@property (nonatomic, strong) NSMutableArray *timerPool;

@end

@implementation ZJTimerPoolManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _timerPool = @[].mutableCopy;
    }
    
    return self;
}

+ (instancetype)shareManager {
    if (!_manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _manager = [[self alloc] init];
        });
    }
    
    return _manager;
}

- (void)addTimer:(NSTimer *)timer {
    [self.timerPool addObject:timer];
}

- (void)removeTimer:(NSTimer *)timer {
    for (NSTimer *obj in self.timerPool) {
        if ([timer isEqual:obj]) {
            [obj invalidate];
            [self.timerPool removeObject:obj];
            break;
        }
    }
    timer = nil;
}

- (void)clearTimerPool {
    for (NSTimer *obj in self.timerPool) {
        NSLog(@"移除了timer = %@", obj);
        [obj invalidate];
    }
    [self.timerPool removeAllObjects];
}

@end
