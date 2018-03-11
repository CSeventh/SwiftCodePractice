//
//  main.swift
//  practice2
//
//  Created by user on 2018/3/11.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

//比较字符串

//hasPrefix(_:)判断前缀
let raj = [
    "ac 1 sc 1:vb",
    "ac 1 sc 2:vc",
    "ac 1 sc 3:vbc",
    "ac 1 sc 4:vc",
    "ac 1 sc 5:vc",
    "ac 2 sc 1:vb",
    "ac 2 sc 2:vb",
    "ac 2 sc 3:vbc",
    "ac 2 sc 4:vb",
    "ac 2 sc 5:vb",
    "ac 2 sc 6:vbc"
]

var ac1Count = 0
for sc in raj {
    if sc.hasPrefix("ac 1"){
        ac1Count += 1
    }
}
print("ac1的个数有\(ac1Count)")


		
