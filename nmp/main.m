//
//  main.m
//  nmp
//
//  Created by xuyan on 2017/10/12.
//  Copyright © 2017年 xuyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TestObject.h"

static __attribute__((constructor)) void before(){
    NSLog(@"开始执行了");
}

static __attribute__((destructor)) void after(){
    NSLog(@"结束执行");
}

int StaticVar(int nAdd){
    static int s_num;
    s_num += nAdd;
    return s_num;
}

int main(int argc, char * argv[]) {
    
//    for (int i = 0 ; i < 5; i++) {
//        int sum = StaticVar(i);
//        NSLog(@"%zd",sum);
//    }
//    
//    [TestObject alloc];
    
    @autoreleasepool {
        int mainRet = UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        return mainRet;
    }
}
