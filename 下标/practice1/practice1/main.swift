//
//  main.swift
//  practice1
//
//  Created by Cseventh on 2018/4/7.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation
//下标
//下标语法
/*
 定义下标使用‘subscript’关键字，指定一个或多个输入参数和返回类型，与实例方法不同的是，下标可以设定为读写或只读。
 */
//subscript(index: Int) -> Int{
//    get{
//        //返回一个适当的Int类型的值
//    }
//    set{
//        //执行适当的赋值操作
//    }
//}

//只读下标
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int{
        return multiplier * index
    }
}

let threeTimes = TimesTable(multiplier: 3)
print("3乘以9等于\(threeTimes[9])")

//下标选项
struct Matrix {
    let rows: Int ,columns: Int
    var grid: [Double]
    init(rows: Int,columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValidForRow(row: Int,column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double{
        get{
            assert(indexIsValidForRow(row: row, column: column), "数组越界")
            return grid[(row * columns) + column]
        }
        set{
            assert(indexIsValidForRow(row: row, column: column), "数组越界")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0,1] = 1.5
matrix[1,0] = 3.2

let some = matrix[2,2]


