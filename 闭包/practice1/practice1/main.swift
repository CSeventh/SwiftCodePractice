//
//  main.swift
//  practice1
//
//  Created by user on 2018/3/27.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation
//闭包

//闭包表达式
/*
 闭包的三种形式：
 ·全局函数是一个有名字但不会捕获任何值得闭包
 ·嵌套函数是一个有名字并可以捕获其封闭函数域内值得闭包
 ·闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
 swift的语法优化主要有
 ·利用上下文推断参数和返回值类型
 ·隐式返回单表达式闭包，即单表达式闭包可以省略’return‘关键字
 ·参数名称缩写
 ·尾随闭包语法
 
 嵌套函数是一个在较复杂函数中方便进行命名和定义自包含代码模块的方式
 */
let names = ["Chris","Alex","Ewa","Barry","Daniella"]
func backward(_ s1: String,_ s2: String) -> Bool{
    return s1>s2
}
var revenames = names.sorted(by: backward)
print(names)
print(revenames)

/*利用闭包表达式语法可以更好的构造一个内联排序闭包
 闭包表达式语法的一般形式
 {（parameters参数）->returnType返回类型 in
 statements
 }
 */
revenames = names.sorted(by: {(s1: String,s2: String) -> Bool in
    return s1 > s2
})  //闭包表达式代码
//闭包函数体部分由关键字’in‘引入，表示闭包的参数和返回值类型定义已经完成
print(revenames)

revenames = names.sorted(by: {(s1:String, s2: String)-> Bool in return s1 > s2})    //函数体部分太短，可以写成一行代码。sorted(by:)方法的整体调用不变，参数变成了内联闭包
print(revenames)

//因为sorted(by:)方法，所以参数必须是(String, String) -> Bool类型，所以还可以继续省略。实际上，闭包作为函数或者方法的参数时，几乎不需要利用完整个事构造内联闭包
revenames = names.sorted(by: {s1,s2 in return s1 > s2})
print(revenames)

//单表达式闭包隐式返回    单行表达式闭包可以通过省略’return‘来隐式返回单行表达式的结果
revenames = names.sorted(by: {s1,s2 in s1 > s2})
print(revenames)

/*参数名称缩写    可以直接通过’$0,$1,$2‘来顺序调用闭包的参数，以此类推
 如果你在闭包表达式中使用参数名称缩写，就可以在闭包定义中省略参数列表，并且对应参数名称缩写的类型会通过函数类型惊喜腿短。in关键字也同样可以被省略，因为此时闭包表达式完全有闭包函数体构成：
 */
revenames = names.sorted(by: {$0 > $1})
print(revenames)

/*运算符方法
 swift的String类型定了关于大于号(>)的字符串实现，其作为一个函数接受两个String类型的参数并返回Bool类型的值
 so
 */
revenames = names.sorted(by: >)
print(revenames)
