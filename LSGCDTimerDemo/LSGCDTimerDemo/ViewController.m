//
//  ViewController.m
//  LSGCDTimerDemo
//
//  Created by wls on 2019/4/25.
//  Copyright © 2019 CX. All rights reserved.
//

#import "ViewController.h"
#import "LSGCDTimer.h"

@interface ViewController ()
@property(nonatomic,strong)LSGCDTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timer = [LSGCDTimer scheduledGCDTimerWithInterval:1 queue:dispatch_get_main_queue() repeats:YES action:^{
        NSLog(@"timer");
    }];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)start:(id)sender {
    [self.timer scheduledGCDTimerWithInterval:1 queue:dispatch_get_main_queue() repeats:YES action:^{
        NSLog(@"timer1");
    }];
}
- (IBAction)cancel:(id)sender {
    [self.timer invalidate];
}

@end
