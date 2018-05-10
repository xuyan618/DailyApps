//
//  AppDelegate.m
//  nmp
//
//  Created by xuyan on 2017/10/12.
//  Copyright © 2017年 xuyan. All rights reserved.
//

#import "AppDelegate.h"
#import "RCTXMLReader.h"
#import "GDataXMLNode.h"
#import "nmp-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [self doCustomerMethond];
    
    // twoSum
//    NSArray *nums = @[@3,@2,@4];
//    NSInteger target = 6;
    Solution *s = [[Solution alloc] init];
    NSLog(@"函数开始执行");
//    //twoSum
//    NSArray *result = [s twoSum:nums :target];
//    NSLog(@"%@",result);
//
//    //addTwoNumbers
//
//    ListNode *node1 = [[ListNode alloc] init:5];
////    ListNode *node2 = [[ListNode alloc] init:4];
////    node1.next = node2;
////    ListNode *node3 = [[ListNode alloc] init:3];
////    node2.next = node3;
//
//    ListNode *node11 = [[ListNode alloc] init:5];
////    ListNode *node12 = [[ListNode alloc] init:6];
////    node11.next = node12;
////    ListNode *node13 = [[ListNode alloc] init:4];
////    node12.next = node13;
//    ListNode *resultNode = [s addTwoNumbers:node1 :node11];
//    NSLog(@"%@",resultNode);
//    NSInteger length1 = [s lengthOfLongestSubstring:@"abcabcbb"];

//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSTimeInterval starttimeInterval = [[NSDate date] timeIntervalSince1970];
//
//        NSLog(@"开始时间：%.0f",starttimeInterval);
//        NSString *charFile = [[NSBundle mainBundle] pathForResource:@"longText" ofType:@"txt"];
//        NSString *orignString = [[NSString alloc]initWithContentsOfFile:charFile encoding:NSUTF8StringEncoding error:nil];
//        NSInteger length = [s lengthOfLongestSubstring:orignString];
//        NSLog(@"%zd",length);
//        NSTimeInterval endtimeInterval = [[NSDate date] timeIntervalSince1970];
//        NSLog(@"结束时间：%.0f",endtimeInterval);
//        NSLog(@"总耗时：%.0f",endtimeInterval - starttimeInterval);
//    });
    // findMedianSortedArrays
    
//    double median = [s findMedianSortedArrays:@[@1,@2] :@[@3,@4]];
//    NSLog(@"%f",median);

    // longestPalindrome
//    NSString *palindrome = [s longestPalindrome:@"cbbd"];
//    NSLog(@"%@",palindrome);
    
    // reserve
//    NSInteger reserve = [s reverse:-1534];
//    NSLog(@"%ld",(long)reserve);
    // convert
//    NSString *convert = [s convert2:@"PAYPALISHIRING" :3];
//    NSLog(@"%@",convert);

//    NSInteger atio = [s myAtoi:@"   -42"];
//    NSLog(@"%ld",(long)atio);
//    BOOL isPali = [s isPalindrome:121];
//    NSLog(@"%d",isPali);
    
//    BOOL isMatch = [s isMatch:@"mississippi" :@"mis*is*p*."];
//    NSLog(@"%d",isMatch);
    
    double pwoe = pow(123, 5);
    double result = fmod(pwoe, 323);
    
    double pwoeD = pow(result, 29);
    double resultD = fmod(pwoeD, 323);
    
    NSString *longSuffix = [s longestCommonPrefix:@[@"c",@"c"]];
    NSLog(@"%@",longSuffix);
    return YES;
}


- (void)doCustomerMethond{
    NSString *xmlJson = [[NSBundle mainBundle]pathForResource:@"xmlJson2" ofType:@"txt"];
    
    NSData *responData = [NSData dataWithContentsOfFile:xmlJson];
    NSString *response = [[NSString alloc] initWithData:responData encoding:NSUTF8StringEncoding];
    
    NSError *error;
//    GDataXMLElement *xmlElement = [[GDataXMLElement alloc]initWithXMLString:response error:&error];
//    NSLog(@"%@",[xmlElement stringValue]);
//    [RCTXMLReader convertXMLFile:xmlJson completion:^(BOOL success, NSMutableDictionary *dictionary, NSError *error) {
//       NSLog(@"%@",dictionary);
//    }];
//    [RCTXMLReader convertXMLData:responData completion:^(BOOL success, NSMutableDictionary *dictionary, NSError *error) {
//        NSLog(@"%@",dictionary);
//    }];
    [RCTXMLReader convertXMLString:response completion:^(BOOL success, NSMutableDictionary *dictionary, NSError *error) {
        NSLog(@"%@",dictionary);
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
