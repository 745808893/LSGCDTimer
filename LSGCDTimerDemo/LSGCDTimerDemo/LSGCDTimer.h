//
//  LSGCDTimer.h
//  LSGCDTimerDemo
//
//  Created by wls on 2019/4/25.
//  Copyright © 2019 CX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSGCDTimer : NSObject

/**
 * queue        传nil默认放到全局队列中
 */
- (instancetype)initGCDTimerWithInterval:(double)interval
                                   queue:(dispatch_queue_t)queue
                                 repeats:(BOOL)repeats
                                  action:(dispatch_block_t)action;

/**
 * queue        传nil默认放到全局队列中
 */
+ (instancetype)scheduledGCDTimerWithInterval:(double)interval
                                        queue:(dispatch_queue_t)queue
                                      repeats:(BOOL)repeats
                                       action:(dispatch_block_t)action;

/**
 * queue        传nil默认放到全局队列中
 */
- (void)scheduledGCDTimerWithInterval:(double)interval
                             queue:(dispatch_queue_t)queue
                           repeats:(BOOL)repeats
                            action:(dispatch_block_t)action;
/**
 *  停止timer
 */
- (void)invalidate;

@end

NS_ASSUME_NONNULL_END
