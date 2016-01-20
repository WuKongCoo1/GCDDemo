//
//  ViewController3.m
//  GCDDemo
//
//  Created by 吴珂 on 16/1/15.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"==========并发线程组==========");
    //dispatch_group
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t concurrentQueue = dispatch_queue_create(NULL, DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i < 10; i++) {
        dispatch_group_async(group, concurrentQueue, ^{
            //do something
            [NSThread sleepForTimeInterval:arc4random_uniform(3)];
            NSLog(@"concurrentQueue%i %@", i, [NSThread currentThread]);
        });
    }
    
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);//阻塞线程组直到线程都执行完毕;
    
    dispatch_group_notify(group, concurrentQueue, ^{
        //do something after all task finish.
        NSLog(@"执行完毕");
    });
    
    NSLog(@"code end");
    
}



@end
