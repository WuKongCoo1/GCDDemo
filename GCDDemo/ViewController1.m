//
//  ViewController1.m
//  GCDDemo
//
//  Created by 吴珂 on 16/1/15.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_async(mainQueue, ^{
        NSLog(@"mainQueue1 %@", [NSThread currentThread]);
    });
    
    dispatch_async(mainQueue, ^{
        NSLog(@"mainQueue2 %@", [NSThread currentThread]);
    });
    
    dispatch_async(mainQueue, ^{
        NSLog(@"mainQueue3 %@", [NSThread currentThread]);
    });
    
    NSLog(@"==========并行队列==========");
    
    //1.并行队列（Concurrent queue）
    //1.1.系统定义的全局并发队列
    /*
     dispatch_get_global_queue(long identifier, unsigned long flags);
     identifier:定义队列的优先级
     flags：预留参数
     */
//    dispatch_queue_t globalQueue = ({
//        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        queue;
//    });
//    dispatch_async(globalQueue, ^{
//        NSLog(@"globalQueue1 %@", [NSThread currentThread]);
//    });
//    
//    dispatch_async(globalQueue, ^{
//        NSLog(@"globalQueue2 %@", [NSThread currentThread]);
//    });
//    
//    dispatch_async(globalQueue, ^{
//        NSLog(@"globalQueue3 %@", [NSThread currentThread]);
//    });
    
    //1.2.自己创建的并发队列
    /*
     dispatch_queue_create(const char *label, dispatch_queue_attr_t attr);
     label:队列名称，debug时区分
     attr:队列类型 DISPATCH_QUEUE_CONCURRENT DISPATCH_QUEUE_SERIAL
     */
    dispatch_queue_t concurrentQueue = ({
        dispatch_queue_t queue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
        queue;
    });
    
    dispatch_async(concurrentQueue, ^{

        NSLog(@"concurrentQueue1 %@", [NSThread currentThread]);
    });
    
    dispatch_async(concurrentQueue, ^{

        NSLog(@"concurrentQueue2 %@", [NSThread currentThread]);
    });
    
    dispatch_async(concurrentQueue, ^{

        NSLog(@"concurrentQueue3 %@", [NSThread currentThread]);
    });


    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
