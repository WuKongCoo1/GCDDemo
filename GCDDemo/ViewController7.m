//
//  ViewController7.m
//  GCDDemo
//
//  Created by 吴珂 on 16/1/16.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "ViewController7.h"

@interface ViewController7 ()

@end

@implementation ViewController7

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"==========信号量控制并发数==========");
    
    __block NSInteger concurrentCount = 1;
    
    //1.创建信号量
    dispatch_semaphore_t semaphore  = dispatch_semaphore_create(4);

    //2.并发执行
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 20; i++) {

            //等待信号 信号量-1，等待信号量大于0才会执行
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            
            NSLog(@"当前并发数 %li", (long)concurrentCount++);
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [NSThread sleepForTimeInterval:arc4random_uniform(2.f)];
                concurrentCount--;
                //发送信号 信号量加1
                dispatch_semaphore_signal(semaphore);
            });

        }
    });
    NSLog(@"code end");
   
}



@end
