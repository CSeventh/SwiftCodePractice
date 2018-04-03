//
//  main.swift
//  practice1
//
//  Created by Cseventh on 2018/4/2.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation
//属性
//计算属性和属性观察器

//计算属性
/*
 计算属性不直接存储值，而是提供一个getter和一个可选的setter，来间接获取和设置其他属性或变量的值
 如果计算数学的setter没有定义新值的参数名，则可以使用默认名称newValue
 
 只有getter没有setter的计算属性就是 只读计算属性。可以通过点运算符访问，但不能设置新的值
 注意！！
    必须使用 var 关键字定义计算属性，包括只读计算属性！
 */
struct  Point {             //一个(x,y)的坐标
    var x = 0.0 ,y = 0.0
}

struct Size {               //宽和高
    var width = 0.0, height = 0.0
}

struct Rect {               //一个有原点和尺寸的矩形
    var origin = Point()
    var size = Size()
    var center : Point {
        get{
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX, y: centerY)
        }
        set{                //没定义新值的参数名，所以使用newValue
            origin.x = newValue.x - (size.width/2)
            origin.y = newValue.y - (size.height/2)
        }
//        set(newCenter) {
//            origin.x = newCenter.x - (size.width/2)         //新的原始坐标等于新的中心点减去宽
//            origin.y = newCenter.y - (size.height/2)        //...
//        }
//
        
        /*
         
         */
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
print("现在square.center的位置在\(square.center.x),\(square.center.y)")//中心位置（5.5）

let initialSquareCebter = square.center
square.center = Point(x: 12.0, y: 12.0)                             //中心位置到（12.12）
print("现在square.center的位置在\(square.center.x),\(square.center.y)")


//只读计算数学的声明可以去掉 get 关键字和花括号：
struct Cubiod {
    var width = 0.0 ,height = 0.0 ,depth = 0.0
    var voiume: Double {
        return width * height * depth
    }
}
let test = Cubiod(width: 4, height: 5, depth: 2)
print("test的体积为\(test.voiume)")

//属性观察器
/*
 'willSet'在新的值被设置之前调用       如果没有指定参数名称，则使用默认参数名’newValue‘
 'didSet'在新的值被设置之后立即调用     如果没有指定参数名称，则使用默认参数名’oldValue‘
 父类的属性在子类的构造器中被赋值时，他在父类中的’willSet‘和’didSet‘观察器会被调用，随后才会调用子类的观察器。
 
 */
class StepCounter{
    var totalStep : Int = 0{
        willSet {
            print("我将走\(newValue)步！")
        }
        didSet{
            if totalStep > oldValue {
                print("多走\(totalStep-oldValue)步！")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalStep = 200
stepCounter.totalStep = 300
stepCounter.totalStep = 250
