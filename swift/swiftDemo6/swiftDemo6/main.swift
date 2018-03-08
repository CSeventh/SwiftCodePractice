//
//  main.swift
//  swiftDemo6
//
//  Created by user on 2018/3/8.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

print("Hello, World!")

//泛型
func repeatItem<Item>(repeating item: Item, numberOfTimes: Int) ->[Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
print(repeatItem(repeating: "knock", numberOfTimes: 3))

//重新实现swift标准库中的可选类型
enum OptionalValue<Wrapped>{
    case None
    case Some(Wrapped)
}
var possibleInteger:OptionalValue<Int> = .None      //.None?
possibleInteger = .Some(100)

//在类型名后面使用where来置顶对类型的需求
func anyCommonElements<T:Sequence, U:Sequence>(_ lhs: T,_ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
print(anyCommonElements([1,2,3], [1]))
