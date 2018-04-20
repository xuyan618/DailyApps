//
//  ViewController.m
//  nmp
//
//  Created by xuyan on 2017/10/12.
//  Copyright © 2017年 xuyan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int reverserRound;
    int reverserExchange;
}
@property (nonatomic, copy) NSString *start;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1", nil];
    [[NSUserDefaults standardUserDefaults]setObject:arr forKey:@"test"];
    NSMutableArray *tempArr = [[NSUserDefaults standardUserDefaults] objectForKey:@"test"];
//    [tempArr addObject:@"124"];
    
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [[NSUserDefaults standardUserDefaults]setObject:@[@"1",@"2",@"3"] forKey:@"test"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        NSLog(@"thread:%@,arr:%@",[NSThread currentThread],[[NSUserDefaults standardUserDefaults] objectForKey:@"test"]);
//    });
//    NSLog(@"thread:%@,arr:%@",[NSThread currentThread],tempArr);
}

- (IBAction)testQucikSort:(id)sender{
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    NSMutableArray *dataSorce = [NSMutableArray arrayWithObjects:@(6),@(1),@(2),@(5),@(9),@(4),@(3),@(7), nil];
//    for (int i = 0; i < 8; i++) {
//        [dataSorce addObject:@(arc4random() % 8)];
//    }
//    [self maoPaoSort:dataSorce];
//    [self xuanZeSort:dataSorce];
    [self quickSortArrary:dataSorce withLeftIndex:0 withRightIndex:dataSorce.count -1];
    NSLog(@"循环次数：%zd",reverserRound);
    NSLog(@"交换次数: %zd",reverserExchange);

    //    NSLog(@"%@",dataSorce);
    NSTimeInterval timeInterval2 = [[NSDate date] timeIntervalSince1970];
    NSLog(@"耗时：%.0f毫秒",(timeInterval2 *1000 - timeInterval *1000));
    NSLog(@"%@",dataSorce);
}

/**
 冒泡排序
 两两比较，选择较大的往后排
 @param arr arr description
 */
- (void)maoPaoSort:(NSMutableArray *)arr{
    int i,j,temp;
    int allRound = 0;
    int exchangeCount = 0;
    for (i = 0; i < arr.count; i++) {
        for (j = 0; j <arr.count -1; j++) {
            allRound ++;
            if (arr[j] > arr[j+1]) {
                temp = [arr[j] intValue];
                arr[j] = arr[j+1];
                arr[j+1] = @(temp);
                exchangeCount ++;
            }
        }
    }
    NSLog(@"循环次数：%zd",allRound);
    NSLog(@"交换次数: %zd",exchangeCount);
}

/**
 选择排序

 @param arr arr description
 */
- (void)xuanZeSort:(NSMutableArray *)arr{
    int allRound = 0;
    int exchangeCount = 0;

    int i,j,temp;
    for (i = 0; i < arr.count; i++) {
        //内排序
        for (j = i + 1; j < arr.count; j++) {
            allRound ++;
            if(arr[i] > arr[j]){
                temp = [arr[i] intValue];
                arr[i] = arr[j];
                arr[j] = @(temp);
                exchangeCount ++;
            }
        }
    }
    NSLog(@"循环次数：%zd",allRound);
    NSLog(@"交换次数: %zd",exchangeCount);

}

/**
 快速排序,递归

 @param arr arr description
 @param left left description
 @param right right description
 */
- (void)quickSortArrary:(NSMutableArray *)arr withLeftIndex:(int)left withRightIndex:(int)right{
    if (left >=right) {
        return;
    }
    int i = left;
    int j = right;
    NSInteger key = [arr[i] integerValue];
    while (i < j) {
        while (i < j && [arr[j] integerValue] >= key) {
            reverserRound ++;
            j--;
        }
        arr[i] = arr[j];
        reverserExchange ++;
        while (i < j && [arr[i] integerValue] <= key) {
            reverserRound ++;
            i++;
        }
        arr[j] = arr[i];
        reverserExchange ++;
    }
    // 基准位置归位
    arr[i] = @(key);
    reverserExchange ++;
    [self quickSortArrary:arr withLeftIndex:left withRightIndex:i -1];
    [self quickSortArrary:arr withLeftIndex:i+1 withRightIndex:right];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
