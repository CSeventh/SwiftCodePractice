//
//  main.swift
//  swiftDemo2
//
//  Created by user on 2018/3/6.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

//对象和类
//1创建类
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) sides."
    }
}


//2创建类实例
//var shape = Shape()
//shape.numberOfSides = 7
//var shapeDescription = shape.simpleDescription()


//3.添加函数init
class NamedShape{
    var numberOfSides: Int = 0
    var name : String
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) sides."
    }
}


//4.子类,重写方法
class Square: NamedShape{
    var sideLength: Double
    
    init(sideLength: Double,name: String) {
        self.sideLength = sideLength
        super.init(name: name)  //父类的name
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength*sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
//print(test.area(),test.simpleDescription())

    //练习
class Circle:NamedShape{
    var radius: Double
    
    init(radius: Double,name :String) {
        self.radius = radius
        super.init(name: name)
    }
    func area() -> Double {
        return 3.14*radius*radius
    }
    override func simpleDescription() -> String {
        return "Yes you are right \(name)"
    }
}
let test1 = Circle(radius: 3, name: "Cseven")
//print(test1.area(),test1.simpleDescription())

//5.getter和setter属性
class EquilateralTriangle:NamedShape{
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength    //设置子类声明的属性值
        super.init(name: name)          //调用父类的构造器
        numberOfSides = 3               //改变父类定义的属性值。
    }
    
    var perimeter:Double{
        get{
            return 3.0*sideLength
        }
        set{
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateralTriangle with sides of length\(sideLength)."
    }
}
var triangle  = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
//print(triangle.perimeter)
triangle.perimeter = 9.9
//print(triangle.perimeter)

//确保三角形的边长总是和正方形的边长相同               ????
class TriangleAndSquare {
    var triangle: EquilateralTriangle{
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square{
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double,name : String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

//处理变量的可选值              ????
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
//print(sideLength)

		
