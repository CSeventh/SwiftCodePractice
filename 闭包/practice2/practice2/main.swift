//
//  main.swift
//  practice2
//
//  Created by user on 2018/3/27.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation//尾随闭包和值捕获

let names = ["Chris","Alex","Ewa","Barry","Daniella"]
func backward(_ s1: String,_ s2: String) -> Bool{
    return s1>s2
}
var revenames = names.sorted(by: backward)
print(names)
print(revenames)

//尾随闭包
/*
 如果需要一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性
 在使用尾随闭包时，不用写出它的参数标签
 */

//前面闭包表达式的闭包为   revenames = names.sorted(by: {$0 > $1})     可以改写为
revenames = names.sorted(){$0 > $1}
print(revenames)
//如果闭包表达式是函数或方法的  唯一  参数，甚至可以把‘()’省略掉
revenames = names.sorted{$0 > $1}
print(revenames)

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map{
    (number) -> String in
    var number = number     //闭包或者函数的参数总是常量，所以必须要var一个变量
    var output = ""         //？？
    repeat {
        output = digitNames[number % 10]! + output      // ! 返回一个可选值，这里用于强制解包存储在可选类型的返回值中的String类型的值        ？？？ 
        number /= 10
    } while number > 0
    return output
}
print(strings)


//值捕获
/*
 incre()虽然没有接收参数但是从外围函数捕获了runningTotal和amount变量的引用

 下面一个使用的例子表明，当你创建一个新的'incre'时，它会有属于自己的引用，指向一个全新、独立的runningTotal变量
    而这个tunningTotal变量，在increByTen()和increBySeven()没有任何联系
 将函数或闭包赋给一个常量或变量，实际上都是讲常量或变量的值设置为对应函数或闭包的引用 79-81
 也就是说，如果你将闭包赋值给了两个不同的常量或者变量，两个值都会指向同一个闭包
 */
//            ( 参数标签  参数名称    )参数（        ）返回值
func makeIncre(forIncre amount: Int) -> () -> Int{
    var runningTotal = 0
    func incre() -> Int{
        runningTotal += amount
        return runningTotal
    }
    return incre                //返回一个函数有什么用？
}

//一个使用的例子
let increByTen = makeIncre(forIncre: 10)
let increBySeven = makeIncre(forIncre: 7)
print(increByTen())     //返回10
print(increByTen())     //返回20
print(increBySeven())   //返回7
print(increBySeven())   //返回14
print(increByTen())     //返回30
print(increBySeven())   //返回21

//闭包是引用类型56-57
let alsoIncreByTen = increByTen
print(alsoIncreByTen()) //返回40
