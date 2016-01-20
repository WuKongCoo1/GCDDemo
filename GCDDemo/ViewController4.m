//
//  ViewController4.m
//  GCDDemo
//
//  Created by 吴珂 on 16/1/16.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"==========串行线程组==========");
    //dispatch_group
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t serialQueue = dispatch_queue_create(NULL, DISPATCH_QUEUE_SERIAL);
    
    for (int i = 0; i < 10; i++) {
        dispatch_group_async(group, serialQueue, ^{
            [NSThread sleepForTimeInterval:1.f];
            NSLog(@"concurrentQueue%i %@", i, [NSThread currentThread]);
        });
    }
    
    //    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);//阻塞主线程组知道线程都执行完毕;
    
    dispatch_group_notify(group, serialQueue, ^{
        NSLog(@"执行完毕");
    });
    
    NSLog(@"code end");
}

@end
