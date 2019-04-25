//
//  LSGCDTimer.m
//  LSGCDTimerDemo
//
//  Created by wls on 2019/4/25.
//  Copyright © 2019 CX. All rights reserved.
//

#import "LSGCDTimer.h"

@interface LSGCDTimer ()

@property dispatch_source_t timer;

@end

@implementation LSGCDTimer

- (instancetype)initGCDTimerWithInterval:(double)interval
                                   queue:(dispatch_queue_t)queue
                                 repeats:(BOOL)repeats
                                  action:(dispatch_block_t)action{
    if (self = [super init]) {
        [self scheduledGCDTimerWithInterval:interval queue:queue repeats:repeats action:action];
    }
    return self;
}

+ (instancetype)scheduledGCDTimerWithInterval:(double)interval
                                        queue:(dispatch_queue_t)queue
                                      repeats:(BOOL)repeats
                                       action:(dispatch_block_t)action{
    return [[LSGCDTimer alloc] initGCDTimerWithInterval:interval queue:queue repeats:repeats action:action];
}

-(void)dealloc{
    if (_timer) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
}

//开始
- (void)scheduledGCDTimerWithInterval:(double)interval
                             queue:(dispatch_queue_t)queue
                           repeats:(BOOL)repeats
                            action:(dispatch_block_t)action{
    [self invalidate];
    //传nil默认放到全局队列中
    if (nil == queue)
    {
        queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_resume(_timer);
    //精准度0.1s
    dispatch_source_set_timer(_timer, dispatch_time(DISPATCH_TIME_NOW, interval*NSEC_PER_SEC), interval*NSEC_PER_SEC, 0.1*NSEC_PER_SEC);
    __weak typeof(self) wkSelf = self;
    dispatch_source_set_event_handler(_timer, ^{
        if (action) {
            action();
        }
        if (!repeats) {
            dispatch_source_cancel(wkSelf.timer);
        }
    });
}

//取消
- (void)invalidate{
    if (_timer) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
}
@end
