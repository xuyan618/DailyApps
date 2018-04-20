//
//  TestObject+Test2.m
//  nmp
//
//  Created by xuyan on 2018/4/12.
//  Copyright © 2018年 xuyan. All rights reserved.
//

#import "TestObject+Test2.h"

@implementation TestObject (Test2)
+ (void)load{
    NSLog(@"被执行了%s",__FUNCTION__);
}
@end
