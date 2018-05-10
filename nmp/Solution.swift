//
//  Solution.swift
//  nmp
//
//  Created by xuyan on 2018/4/18.
//  Copyright © 2018年 xuyan. All rights reserved.
//

import UIKit

class Solution: NSObject {
    
    var max = 0
    var longestPalindrom = ""
    
    
    // 1. 两数之和
    func twoSum(_ nums:[Int],_ target:Int) -> [Int] {
        // 第一层遍历
        for aaa in 0..<nums.count {
            // 第二层遍历
            for bbb in aaa+1..<nums.count{
                let temptarget = nums[aaa]+nums[bbb];
                // 判断条件是否成立
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
        let length = s.count
        let statrtIndx = s.startIndex
        
        while end < length {
            let text = s[statrtIndx.advanced(by: end)]
            
            if map.keys.contains(String(text)) && map[String(text)]! >= start{
                start = map[String(text)]! + 1
            }
            len = end - start + 1
            map[String(text)] = end
            res = res > len ? res:len
            
            end += 1

        }
        return res
    }
    
    // 3. 无重复字符的最长子串
    func lengthOfLongestSubstring(_ s: String) -> Int {
        return self.lengthOfLongestSubstringMethod2(s)
    }
    // 4.两个排序数组的中位数
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let sizeA = nums1.count, sizeB = nums2.count;
        if (sizeA <= 0 && sizeB <= 0) {
            return 0;
        }
        
        let total = sizeA + sizeB;
        if (total % 2 == 1) {
            return findKth(nums1, 0, nums2, 0, total / 2 + 1);
        }
        else {
            return (findKth(nums1, 0, nums2, 0, total / 2) + findKth(nums1, 0, nums2, 0, total / 2 + 1)) / 2;
        }
    }
    
    func findKth(_ nums1:[Int], _ i:Int, _ nums2:[Int],_ j:Int,_ k:Int)->Double {
        // 首先需要让数组1的长度小于或等于数组2的长度
        if (nums1.count - i > nums2.count - j) {
            return findKth(nums2, j, nums1, i, k);
        }
        // 判断小的数组是否为空，为空的话，直接在另一个数组找第K个即可
        if (nums1.count == i) {
            return Double(nums2[j + k - 1]);
        }
        // 当K = 1时，表示我们要找第一个元素，只要比较两个数组的第一个元素，返回较小的那个即可
        if (k == 1) {
            
            return (nums1[i] < nums2[j] ? Double(nums1[i]):Double(nums2[j]));
        }
    
        let pa = min(i + k / 2, Int(nums1.count)), pb = j + k - pa + i;
    
        if (nums1[pa - 1] < nums2[pb - 1]) {
            return findKth(nums1, pa, nums2, j, k - pa + i);
        }
        else if (nums1[pa - 1] > nums2[pb - 1]) {
            return findKth(nums1, i, nums2, pb, k - pb + j);
        }
        else {
            return Double(nums1[pa - 1]);
        }
    }
    // 4.最长回文子串
    func longestPalindrome(_ s: String) -> String {
        return longestPalindrome2(s)
    }
    func longestPalindrome2(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        var maxLength = 1
        var maxStrIndex = 0
        var str = String()
        str += "$"
        for i in s {
            str += "#"
            str.append(i)
        }
        str += "#"
        var sArray = Array(str)
        let length = str.count
        
        var p = Array.init(repeating: 0, count: length)
        var id = 0
        var mx = 0
        for i in 1 ..< length {
            if mx > i {
                p[i] = min(mx - i, p[2 * id - i])
            } else {
                p[i] = 1
            }
            while p[i] + i < sArray.count && sArray[i + p[i]] == sArray[i - p[i]] {
                p[i] += 1
            }
            if p[i] + i > mx {
                mx = p[i] + i
                id = i
            }
            if p[i] > maxLength {
                maxLength = p[i]
                maxStrIndex = i
            }
        }
        
        let starindex = s.index(s.startIndex, offsetBy: maxStrIndex / 2 - (maxLength) / 2)
        let endIndex = s.index(starindex, offsetBy: maxLength - 1)
        return String(s[starindex ..< endIndex])
    }
    
    func longestPalindrome1(_ s:String) -> String {
        if s.isEmpty || s.count == 0 {
            return ""
        }
        let lenght = s.count

        for start in 0..<lenght {
            checkPalindromeExpand(s, start, start)
            checkPalindromeExpand(s, start, start + 1)
        }
        return longestPalindrom
    }
    
    func checkPalindromeExpand(_ s:String, _ lowT:Int, _ hightT:Int) -> Void {
        var low = lowT,hight = hightT
        
        let lenght = s.count
        let statrtIndx = s.startIndex

        while low >= 0 && hight < lenght {
            let leftText = s[statrtIndx.advanced(by: low)]
            let rightText = s[statrtIndx.advanced(by: hight)]
            if leftText == rightText {
                if hight - low + 1 > max {
                    max = hight - low + 1
                    longestPalindrom = String(s[statrtIndx.advanced(by: low)...statrtIndx.advanced(by: hight)])
                }
                low -= 1
                hight += 1
            }else{
                return
            }
        }
    }
    // 复杂度为O(n^3)
    func quickLongestPalindrome(_ s:String) -> String {
        if s.isEmpty || s.count == 0 {
            return ""
        }
        var res = ""
        let length = s.count
        let statrtIndx = s.startIndex
        for start in 0..<length {
            for end in start..<length{
                if end - start >= res.count {
                    let subString = s[statrtIndx.advanced(by: start)...statrtIndx.advanced(by: end)]
                    if isPalinadrom(String(subString)) {
                        res = String(subString)
                    }
                }
            }
        }
        return res
    }
    
    func isPalinadrom(_ s:String) -> Bool {
        var isPalinadrom = true
        
        let statrtIndx = s.startIndex
        
        var left = 0,right = s.count - 1
        while left <= right {
            let leftText = s[statrtIndx.advanced(by: left)]
            let rightText = s[statrtIndx.advanced(by: right)]
            if leftText != rightText {
                isPalinadrom = false
                break
            }
            left += 1
            right -= 1
        }
        return isPalinadrom
    }
    //7、反转整数
    func reverse(_ x: Int) -> Int {        
        
        let str = String(abs(x))
        let reversedStr = String(str.reversed());
        let res = Int(reversedStr)!
        if res > 1<<31 {
            return 0
        }
        if x < 0 {
            return  -Int(reversedStr)!
        }else{
            return  Int(reversedStr)!
        }
    }
    // 6、Z子型
    func convert(_ s: String, _ numRows: Int) -> String {
        
        guard s.count > 2 && numRows > 1 else {
            return s
        }
        // 三部分在存储数据,构造二维数组
        var tempArr = Array<Array<String>>()
        let startIndex = s.startIndex
        let strCount = s.count
        let rowCount = 2 * numRows - 2
        var allColum = (strCount / rowCount) * (numRows - 1) + (strCount % rowCount)%(numRows - 1)
        allColum = strCount < rowCount ? (strCount/numRows + strCount % numRows) : allColum

        for i in 0..<allColum+1 {
            var tempRow = Array<String>()
            for j in 0..<numRows {
                if i % (numRows - 1) == 0{
                    let offset = i / (numRows - 1) * (2 * numRows - 2) + (i % (numRows - 1)) + j;
                    if (offset < s.count) {
                        tempRow.append(String(s[startIndex.advanced(by:offset)]))
                    }else{
                        tempRow.append("")
                    }
                }else if (i + j)%(numRows - 1) == 0{
                    let offset = (i + j)/(numRows - 1) * numRows + ((i + j)/(numRows - 1) - 1) * (numRows - 2) + (i - 1) % (numRows - 1)
                    
                    if (offset < s.count) {
                        tempRow.append(String(s[startIndex.advanced(by: offset)]))
                    }else{
                        tempRow.append("")
                    }
                }else{
                    tempRow.append("")
                }
            }
            tempArr.insert(tempRow, at: i)
        }
        var res = ""
        
        for ii in 0..<numRows {
            for tempRow in tempArr{
                res += tempRow[ii]
            }
        }
        return res;
    }
    
    // 快速遍历
    func convert2(_ s: String, _ numRows: Int) -> String {
        guard numRows >= 2 else {
            return s
        }
        
        let chars = [Character](s.characters)
        let charCount = chars.count
        
        let loop = numRows + (numRows - 2)
        var result = ""
        for rowIndex in 0 ..< numRows {
            var row = ""
            for num in stride(from:rowIndex, to:charCount, by: loop) {
                row.append(chars[num])
                
                // not first row, not last row
                if rowIndex > 0 && rowIndex < numRows - 1 {
                    let next = num + (numRows - rowIndex - 1) * 2
                    
                    if next < charCount {
                        row.append(chars[next])
                    }
                }
            }
            
            result.append(row)
        }
        
        return result
    }
    
    func myAtoi(_ str: String) -> Int {
        let tempStr = str.trimmingCharacters(in: .whitespaces)
        guard !tempStr.isEmpty else {
            return 0
        }
        let chars = [Character](tempStr.characters)

        // 第一个是字母，返回0
        
        let firstCharacter = chars[0]
        for temp in (firstCharacter.unicodeScalars) {
            if CharacterSet.letters.contains(temp) {
                return 0
            }
        }
        if firstCharacter == "+" || firstCharacter == "-"{
            if(chars.count > 1){
                // 判断后面是否为数字
                var isDecimal:Bool = false
                
                for temp in (chars[1].unicodeScalars) {
                    if CharacterSet.decimalDigits.contains(temp) {
                        isDecimal = true
                        break
                    }
                }
                if isDecimal {
                    return cal(tempStr)
                }
            }else{
                return 0
            }
        }
        var isDecimal:Bool = false
        
        for temp in (firstCharacter.unicodeScalars) {
            if CharacterSet.decimalDigits.contains(temp) {
                isDecimal = true
                break
            }
        }
        if isDecimal {
            return cal(tempStr)
        }
        return 0
    }

    func cal(_ str: String) -> Int {
        let scanner = Scanner(string: str)
        scanner.scanUpToCharacters(from: CharacterSet.decimalDigits, into: nil)
        var number :Int = 0
        scanner.scanInt(&number)
        if number == 0 {
            return 0
        }
        let numberIndex = str.range(of: "-")?.lowerBound
        if numberIndex == str.startIndex {
            if -number < Int32.min {
                return -1<<31
            }else{
                return -number
            }
            
        }else{
            if number > Int32.max {
                return 1<<31-1
            }else{
                return number
            }
        }
    }
    
    // 9. 回文数
    func isPalindrome(_ x: Int) -> Bool {
        // 正数
        guard x >= 0 else {
            return false
        }
        var tempX = x
        var newx = 0
        while tempX > 0 {
            newx = newx * 10 + tempX % 10
            tempX /= 10
        }
        
        return newx == x
    }
    //10. 正则表达式匹配
    func isMatch(_ s: String, _ p: String) -> Bool {
        
        if s.isEmpty && p.isEmpty  {
            return true
        }
        
        let schars = [Character](s.characters)
        let pchars = [Character](p.characters)
        
        let c0 = getChars(schars, 0),p0 = getChars(pchars, 0),p1 = getChars(pchars, 1);
        
        if (match(c0, p0) || p1 == "*") {
            if (p1 != "*") {
                if (s.isEmpty){
                    return false
                }
                let subS = s.substring(from: s.startIndex.advanced(by: 1))
                let subP = p.substring(from: p.startIndex.advanced(by: 1))
                return isMatch(subS, subP);
            }
            // if p1 is *, * means 0 ~ n
            var i = 0;
            let subS = s.substring(from: s.startIndex)
            let subP = p.substring(from: p.startIndex.advanced(by: 2))

            var ret:Bool = isMatch(subS, subP); // try 0
            if (ret) {
                return ret;
            }
            while (i < schars.count && match(getChars(schars, i), p0)) {
                let subS = s.substring(from: s.startIndex.advanced(by: i+1))
                let subP = p.substring(from: p.startIndex.advanced(by: 2))

                ret = isMatch(subS, subP); // try for every available position
                if (ret){
                    return ret;
                }
                i += 1;
            }
        }
        
        return false
    }
    
    func match(_ a:Character, _ b:Character) -> Bool {
        return a == b || b == "."
    }
    func getChars(_ s:[Character], _ index:Int) -> Character {
        if s.count > index {
            return s[index]
        }
        return Character.init(" ")
    }
    
    // 11. 盛最多水的容器
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0,left = 0,right = height.count - 1
        
        while left < right {
            let minHeight = min(height[left], height[right])

            maxArea = max(minHeight * (right - left), maxArea)
            if height[left] == minHeight {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxArea
    }
    // 14.最长功能子串
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        guard strs.count > 0 else {
            return ""
        }
        guard strs.count > 1 else {
            return strs[0]
        }
        let subStr = strs[0]
        guard subStr.count > 0 else {
            return ""
        }
        var prefix = ""
        
        for i in 1..<subStr.count + 1 {
            guard subStr.count > 0 else {
                break
            }
            var start = 0
            let tempSub = subStr.substring(to: subStr.startIndex.advanced(by: i))
            var stop = false
            
            while start < strs.count {
                let tempStr = strs[start]
                let hasSuff = tempStr.hasPrefix(tempSub)
                if !hasSuff {
                    stop = true
                    break
                }else{
                    start += 1
                }
            }
            if stop {
                break
            }else{
                prefix = tempSub
            }
        }
        
        return prefix
    }
}
