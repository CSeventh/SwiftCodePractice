//
//  main.swift
//  swiftDemo4
//
//  Created by user on 2018/3/8.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

//协议和扩展
protocol ExampleProtocol{   //声明一个协议
    var simpleDescription: String { get }
    mutating func adjust()  //mutating关键字用来标记一个会修改结构体的方法 ？？？
}

//类、枚举和结构体都可以实现协议。
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty : Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//用extension来为现有的类型添加功能
extension Int: ExampleProtocol{     //扩展Int
    var simpleDescription:String {
        return "The number \(self)"
    }
    mutating func   adjust() {      //调用？？？
            self += 7
    }
}
print(7.simpleDescription)

//Double的扩展
//extension Double: ExampleProtocol{
//    var simpleDescription:String {
//        return "The numble of \(self)"
//    }
//    mutating func   adjust() {
//        self += 44
//    }
//}
//print(6.6.simpleDescription)

//可以像类名一样使用协议名
let protocolVaue: ExampleProtocol = a
print(protocolVaue.simpleDescription)
//print(protocolVaue.anotherProperty)   //anotherProperty不是在协议内实现的内容么？
