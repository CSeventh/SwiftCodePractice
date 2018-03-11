//
//  main.swift
//  swiftDemo5
//
//  Created by user on 2018/3/8.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

//错误处理
//使用采用Error协议的类型来表示错误
enum PrinterError:Error {
    case OutOfPaper
    case NoToner
    case OnFire
}

//用Throw来抛出错误
func send(job: Int, toPrinter printerName: String) throws -> String{
    if printerName == "Never Has Toner" {
        throw PrinterError.NoToner
    }
    return "job sent"
}

//do-catch进行错误处理
do {            //try用来标记可以抛出错误的代码
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
}catch {        //若没有另外命名，则错误自动命名为error
    print(error)
}

//可用多个catch来处理特定的错误
do{
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
}catch PrinterError.OnFire{
    print("I'll just put this over here, with the resr of the fire")
}catch let printerError as PrinterError {
    print("Printer error: \(printerError)")
}catch {
    print(error)
}

//另一种处理错误的方式使用try？将结果转换为可选的。若抛出错误，则错误会被抛弃且结果为nil。否则结果会是一个包含函数返回值的可选值。
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

//使用defer代码块来表示在函数返回前，函数中最后执行的代码（这段代码无论抛出错误都会被执行）
var fridgeIsOpen = false
let fridgeContent = ["milk","eggs","leftovers"]

func fridgeContains(_ food: String) -> Bool{        //下划线在此处用来起忽略作用   忽略外部的参数名见 L63
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)
