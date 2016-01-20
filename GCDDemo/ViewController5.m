//
//  ViewController5.m
//  GCDDemo
//
//  Created by 吴珂 on 16/1/16.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "ViewController5.h"

@interface ViewController5 ()

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"==========dispatch_barrier 非阻塞式==========");
    
    dispatch_queue_t concurrentQueue = ({
        dispatch_queue_t queue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
        queue;
    });
    for (int i = 0; i < 10; i++) {
        

            if (i != 5) {
                dispatch_async(concurrentQueue, ^{
                    [NSThread sleepForTimeInterval:arc4random_uniform(3)];
                    NSLog(@"dispatch_async %i", i);
                });
            }else{
                dispatch_barrier_async(concurrentQueue, ^{
                    NSLog(@"dispatch_barrier_async");
                });
            }
    }
}



@end
