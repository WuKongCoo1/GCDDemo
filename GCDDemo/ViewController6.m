//
//  ViewController6.m
//  GCDDemo
//
//  Created by 吴珂 on 16/1/16.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "ViewController6.h"

@interface ViewController6 ()

@end

@implementation ViewController6

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_group_t group = dispatch_group_create();
    NSLog(@"==========dispatch_barrier 阻塞式==========");
    dispatch_queue_t concurrentQueue = ({
        dispatch_queue_t queue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
        queue;
    });
    
    for (int i = 0; i < 10; i++) {
        
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            if (i != 5) {
                dispatch_async(concurrentQueue, ^{
                    [NSThread sleepForTimeInterval:3.f];
                    NSLog(@"dispatch_async %i", i);
                });
            }else{
                dispatch_barrier_sync(concurrentQueue, ^{
                    NSLog(@"dispatch_barrier_sync 等我5秒钟就好 %@", [NSThread currentThread]);
                    [NSThread sleepForTimeInterval:5.f];
                    
                });
                NSLog(@"等的心好累");
            }
        });
    }
    NSLog(@"code end");
}

@end
