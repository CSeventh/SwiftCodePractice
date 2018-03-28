//
//  main.swift
//  practice3
//
//  Created by user on 2018/3/28.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation   //逃逸闭包和自动闭包

//逃逸闭包 ---- 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包存函数中逃逸
/*
 当 定义 闭包作为参数的 函数 时，可以在参数名之前标注’@escaping‘,用来指明这个闭包是允许“逃逸”出这个函数的
 一种能使闭包”逃逸“出函数的方法是，将闭包保存在一个函数外部定义的变量中。
  ·比如很多启动异步操作的函数接受一个闭包参数作为‘completion handler’，这类函数会在异步操作开始之后立刻返回，但是闭包要直到异步操作结束后才会被调用。这时，闭包需要在函数返回之后被调用，即‘逃逸’出函数。
 将一个闭包标记为‘@escaping’意味着必须在比保重显式的引用‘self’
  ·传递到someFunctionWithEscapingClosure(_:)中的闭包是一个逃逸闭包，所以必须显式的引用self
  ·传递到someFunctionWithNonescapingClosure(_:)中的闭包是一个非逃逸闭包，所以可以隐式的引用self
 */

//逃逸闭包
var completionHandlers: [() -> Void] = []       //这是个什么东西- -
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

//非逃逸闭包
func someFunctionWithNonescapingClosure(closure: () -> Void){
    closure()
}

class SomeClass{
    var x = 10
    func doSomething(){
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()     //?????
print(instance.x)


//自动闭包
/*
 自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用时会返回被包装在其中的表达式的值
 自动闭包能够延迟求值，因为知道调用这个闭包，代码段才会被执行。
 */
var customersInLine = ["Chris", "Alex", "Ewa", "Barrt", "Daniella"]
print(customersInLine.count)        //输出5

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)        //由于闭包还没有执行，所以任然输出5

print("现在出来一个\(customerProvider())")        //直到调用这个闭包，代码段才会被执行
print(customersInLine.count)                    //闭包被执行了，所以输出4

//将闭包作为参数传递给函数时，能获得同样的延时求值欣慰。
print(customersInLine)
func serve(customer customerProvider: () -> String) {
    print("来吧，再出来一个\(customerProvider())!")
}

//两种都行，因为customerProvider在这里是一个‘() -> String’类型的函数
//serve(customer: customerProvider)
serve(customer: { customersInLine.remove(at: 0) })


//上面的serve(customer:)接受一个显式的闭包，下面的serve(customer:)完成相同的操作，但是是通过将参数标记为‘@autoclosure’来接受一个自动闭包，现在该函数可以作为接受String类型参数（而不是闭包）的函数来调用
func serve(customer customerProvider: @autoclosure () -> String){
    print("又出去一个\(customerProvider())")
}
serve(customer: customersInLine.remove(at: 0))



//当想让一个自动闭包可以“逃逸”时，应该同时使用@autoclosure和@escaping属性。          //代码有问题？？？
print(customersInLine)
var customerProviders: [() -> String] = []      //'() -> String'型的数组
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

print(customerProviders)
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print(customerProviders)
print("\(customerProviders.count)个闭包被选择了")
for customerProvider in customerProviders{
    print("现在\(customerProvider)出来")
}
