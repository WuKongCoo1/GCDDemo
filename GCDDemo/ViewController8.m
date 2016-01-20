//
//  ViewController8.m
//  GCDDemo
//
//  Created by 吴珂 on 16/1/20.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "ViewController8.h"

@interface ViewController8 ()

@end

@implementation ViewController8

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t concurrentQueue = ({
        dispatch_queue_t queue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
        queue;
    });
    NSLog(@"阻塞式开始");
    for (int i = 0; i < 10; i++) {


    if (i != 5) {
        dispatch_async(concurrentQueue, ^{
            NSLog(@"dispatch_async %i", i);
        });
    }else{
        dispatch_barrier_sync(concurrentQueue, ^{

            NSLog(@"dispatch_barrier_sync 不好意思，阻塞了 %@", [NSThread currentThread]);
        });
    }
    }
    NSLog(@"阻塞这么久");

}


@end
