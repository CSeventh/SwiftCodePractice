//
//  main.swift
//  swiftDemo1
//
//  Created by user on 2018/3/6.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

func makeIncrementer() -> ((Int)->Int) {
    func addOne(number:Int)->Int{
        return 1 + number
    }
    return addOne
}



func sumOf(numbers :Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
//sumOf(numbers: 42,597,12)
//sumOf()
//print(sumOf())


func averOf(numbers1:Double...)->Double{
    var sum:Double = 0
    var t:Double = 0
    for number in numbers1 {
        sum += number
        t += 1
    }
    return sum/t
}
//print(averOf(numbers1: 3,6,9,12, 15))

func hasAnyMatches(list:[Int],condition:(Int)->Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number :Int) ->Bool{
    return number<10
}
var numbers = [17]
//print(hasAnyMatches(list: numbers, condition: lessThanTen(number:)))

numbers.map({
    (number:Int)->Int in
    let result = 3 * number
    return result
})

let mappedNumbers = numbers.map({number in 3 * number})
print(mappedNumbers)
		
