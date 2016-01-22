//
//  ViewController10.m
//  GCDDemo
//
//  Created by 吴珂 on 16/1/22.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "ViewController10.h"

@interface ViewController10 ()

@end

@implementation ViewController10
{
    dispatch_source_t _timer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"==========dispatch_source 实现定时器==========");
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    
    //设置源类型为定时器
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,
                                   0, 0,
                                   queue);
    //设置定时器
    dispatch_source_set_timer(_timer,
                              dispatch_time(DISPATCH_TIME_NOW, 0* NSEC_PER_SEC),//现在开始
                              1* NSEC_PER_SEC,//间隔 1s
                              0);//精度0
    
    //设置事件处理
    dispatch_source_set_event_handler(_timer, ^{
        NSLog(@"一秒过去鸟");
    });
    
    //恢复dispatch_source
    dispatch_resume(_timer);
}

@end
