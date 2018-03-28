//
//  main.swift
//  practice1
//
//  Created by user on 2018/3/21.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

//函数参数标签和参数名称

//参数标签
/*
 每个函数参数都有一个参数表前以及一个参数名称
 可以再函数名称前指定他的参数标签，中间以空格分隔
 如果不希望为某个参数添加一个标签，可以使用一个下划线'_'来省略。
 */
func Func(label name: Int){
    //label为参数标签 name为参数名称
}

func greet(person: String,from homeTown: String) ->String {
    return "你好啊，\(person)~，你的的家乡是\(homeTown)么？"
}
print(greet(person: "CQ", from: "cc"))

func fuc(_ fI: String, sI: String) {
    //_省略了调用函数时fI的显示
}
fuc("fI", sI: "sI")


//默认参数值、可变参数
/*
 可以在函数体中通过给参数赋值来为任意一个参数定义默认值，定义了默认值之后，调用这个函数时可以忽略此参数
 不带有默认值的参数放在函数参数列表的最前
 
 可变参数可以接受零个或多个值，通过在变量类型名后面加‘...’的方式定义可变参数。
 一个函数最多只能拥有一个可变参数
 */
func ffff(fun1 unDefault: Int,fun2 aDefault: Int = 12){
    print(unDefault,aDefault)
}
ffff(fun1: 1,fun2: 22)
ffff(fun1: 22)

func average(_ numbers: Double...) ->Double{
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total/Double(numbers.count)
}
print(average(1))
print(average(1,2,3,4,5,6))
print(average(1.5,3,4.5))


//输入输出参数
/*
 如果想要一个函数可以修改参数的值，并且想要这些修改在函数调用结束后任然存在，就把这个参数定义为输入输出参数
 在参数定义以前加‘inout‘关键字。一个输入输出参数有传入函数的值，这个值被函数修改，然后传出函数，替换原来的值
 因为常量或者字面量不能被修改，所以只能传递变量给输入输出参数
 输入输出参数不能有默认值，而且可变参数不能用’inout‘标记
 */
func swapTwoInts(_ a: inout Int, _ b: inout Int){
    let temp = a
    a = b
    b = temp
}
var aInt = 3
var bInt = 5
print(aInt,bInt)
swap(&aInt, &bInt)
print(aInt,bInt)
