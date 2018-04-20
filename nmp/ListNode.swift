//
//  ListNode.swift
//  nmp
//
//  Created by xuyan on 2018/4/18.
//  Copyright © 2018年 xuyan. All rights reserved.
//

import Foundation

public class ListNode :NSObject{
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
}
