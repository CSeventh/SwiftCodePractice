//
//  main.swift
//  practice1
//
//  Created by user on 2018/3/11.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

//访问和修改字符串

//通过下标语法来访问String特定索引的Character
let greeting = "Guten Tag!"
greeting[greeting.startIndex];      //这是在干嘛？
//greeting[greeting.endIndex]       //越界错误

//character属性的indics属性会创建一个包含全部索引的范围,用在在字符串中访问单个字符
for index in greeting.characters.indices {
    print("\(greeting[index])",terminator:" ")      //terminator不换行
}

//插入和删除
//insert(_:,at:)插入一个字符  insert(contentsOf:,at:)插入字符串
var wel = "hello"
wel.insert("!", at: wel.endIndex)
print(wel)
wel.insert(contentsOf: " here".characters, at: wel.endIndex/*wel.Index(before: wel.endIndex)*/)    //整个这一句都？？？？
print(wel)

wel.remove(at: wel.index(before: wel.endIndex))
print(wel)
let range = wel.index(wel.endIndex,offsetBy: -6) ..< wel.endIndex
wel.removeSubrange(range)
print(wel)
