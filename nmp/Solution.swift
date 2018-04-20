//
//  Solution.swift
//  nmp
//
//  Created by xuyan on 2018/4/18.
//  Copyright © 2018年 xuyan. All rights reserved.
//

import UIKit

class Solution: NSObject {
    // 1. 两数之和
    func twoSum(_ nums:[Int],_ target:Int) -> [Int] {
        // 第一层遍历
        for aaa in 0..<nums.count {
            // 第二层遍历
            for bbb in aaa+1..<nums.count{
                let temptarget = nums[aaa]+nums[bbb];
                // 判断条件是够成了
                if(temptarget == target){
                    return [aaa,bbb];
                }
            }
        }
        return [0,0];
    }
    // 2. 两数相加
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var nodeArr = [ListNode]()
        
        var tempL1 = l1
        var tempL2 = l2
        
        var over = 0
        while (tempL1 != nil || tempL2 != nil || over > 0) {
            var sum:Int = 0
            if(tempL1 != nil){
                sum += tempL1!.val
            }
            if(tempL2 != nil){
                sum += tempL2!.val
            }
            sum += over
            over = sum/10

            let temp = ListNode.init(0)
            temp.val = sum%10
            if(nodeArr.count > 0){
                let resultNode = nodeArr.last;
                resultNode?.next = temp
            }
            nodeArr.append(temp)
            if(tempL1 != nil){
                tempL1 = tempL1!.next
            }else{
                tempL1 = nil;
            }
            if(tempL2 != nil){
                tempL2 = tempL2!.next
            }else{
                tempL2 = nil;
            }
        }
        //取出第一个数据即是最终的节点
        let resultNode = nodeArr[0];
        return resultNode;
    }

    // 一、双层循环方式
    func lengthOfLongestSubstringMethod1(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        var isUniqueStr = String(s[s.startIndex])
        // 遍历整个字符
        for start in 0..<s.count {
            if (start+isUniqueStr.count) < s.count{
             
                for end in (start+isUniqueStr.count)..<s.count{
                    // 子串
                    let startIndex = s.index(s.startIndex, offsetBy: start)
                    let endIndex = s.index(s.startIndex, offsetBy: end)
                    let subStr = s[startIndex...endIndex]
                    
                    // 分段截取子字符串,0...i
                    var isUnique:Bool = true
                    print("当前子字符串:",subStr)
                    if(subStr.count > isUniqueStr.count){
                        // 遍历子字符串中的重复字符
                        var tempSet = [String]()
                        for k in 0..<subStr.count {
                            // 每次取出1个，和剩余字符串比较
                            let subIndex = subStr.index(subStr.startIndex, offsetBy: k)
                            let text = subStr[subIndex]
                            //                    print("要比较的:",text)
                            if(tempSet.contains(String(text))) {
                                isUnique = false
                                break // 出现重复子串，不再遍历，并舍弃当前子串
                            }else{
                                tempSet.append(String(text))
                            }
                        }
                        // 唯一,并且长度大于上次的字符
                        if(isUnique && subStr.count >= isUniqueStr.count){
                            isUniqueStr = String(subStr)
                        }
                        if(!isUnique){
                            break
                        }
                    }
                }
            }
        }
        return isUniqueStr.count
    }
    func max(_ a:Int,_ b:Int) -> Int {
        return a > b ? a:b
    }
    // 二、
    func lengthOfLongestSubstringMethod2(_ s:String) -> Int {
        if s.isEmpty || s.count == 0 {
            return 0
        }
        var map = [String:Int]()
        var res = 0,len = 0,start = 0,end = 0
        while end < s.count {
            let subIndex = s.index(s.startIndex, offsetBy: end)
            let text = s[subIndex]
            var repeatBool = false
            
            if map.keys.contains(String(text)) && map[String(text)]! >= start{
                start = map[String(text)]! + 1
                repeatBool = true
            }
            len = end - start + 1
            map[String(text)] = end
            res = res > len ? res:len
            if repeatBool{
                
            }
            end += 1

        }
        return res
    }
    
    // 3. 无重复字符的最长子串
    func lengthOfLongestSubstring(_ s: String) -> Int {
        return self.lengthOfLongestSubstringMethod2(s)
    }
}
