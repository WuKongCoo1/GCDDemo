//
//  ViewController2.m
//  GCDDemo
//
//  Created by 吴珂 on 16/1/15.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"==========串行队列==========");
    
    //2.串行队列(Serial queue)
    dispatch_queue_t serailQueue = ({
        dispatch_queue_t queue = dispatch_queue_create("serailQueue", NULL);
        queue;
    });
    
    dispatch_async(serailQueue, ^{
        NSLog(@"serailQueue1 %@", [NSThread currentThread]);
    });
    
    dispatch_async(serailQueue, ^{
        NSLog(@"serailQueue2 %@", [NSThread currentThread]);
    });
    
    dispatch_async(serailQueue, ^{
        NSLog(@"serailQueue3 %@", [NSThread currentThread]);
    });

}



@end
