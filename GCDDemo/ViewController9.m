//
//  ViewController9.m
//  GCDDemo
//
//  Created by 吴珂 on 16/1/21.
//  Copyright © 2016年 MyCompany. All rights reserved.
//

#import "ViewController9.h"

@interface ViewController9 ()

@end

@implementation ViewController9

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"==========dispatch_source 基本使用==========");
    
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0, dispatch_queue_create("Serail Queue", DISPATCH_QUEUE_SERIAL));
    
    
    __block NSInteger finishQueueCount = 0;
    dispatch_source_set_event_handler(source, ^{
        
        finishQueueCount += dispatch_source_get_data(source);
        
        NSLog(@"progress %li%%100", finishQueueCount);
        NSLog(@"Current Thread, %@", [NSThread currentThread]);
        
    });
    
    dispatch_resume(source);
    
    for (int i = 1; i <= 100; i++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_source_merge_data(source, 1);
            
            usleep(20000);
        });
    }
    
}



@end
