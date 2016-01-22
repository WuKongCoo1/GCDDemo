//
//  ViewController11.m
//  GCDDemo
//
//  Created by 吴珂 on 16/1/22.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "ViewController11.h"

@interface ViewController11 ()

@end

@implementation ViewController11

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSLog(@"==========dispatch_queue 挂起==========");
    
    dispatch_queue_t serailQueue = dispatch_queue_create("Serail queue", DISPATCH_QUEUE_SERIAL);

    dispatch_async(serailQueue, ^{
        NSLog(@"task 1");
        sleep(1);
        NSLog(@"task 1 done");
    });
    
    dispatch_group_t group = dispatch_group_create();
    
    
    /*
     dispatch_suspend 的作用是挂起线程，对这个线程中正在执行的任务没有影响，还未开始的任务暂停执行
     需要注意的是dispatch_suspend 与 dispatch_resume 成对出现
     */
    dispatch_group_async(group, serailQueue, ^{
       NSLog(@"挂起 globalQueue");

       dispatch_suspend(serailQueue);
    });
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    dispatch_async(serailQueue, ^{
        NSLog(@"我是被挂起的task");
    });
    
    NSLog(@"hheheheheh");
    
    dispatch_resume(serailQueue);
    
    
    
}
@end
