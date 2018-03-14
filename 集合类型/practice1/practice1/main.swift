//
//  main.swift
//  practice1
//
//  Created by user on 2018/3/12.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

//集合类型
//数组

//主要由于不熟悉该类型的创建语法以及常用的属性所以emmmmm，既然后面的要打所以干脆前面的数组也练了吧~
/*
 可以通过 + 直接将两个数组相加
 35行也可以直接写成 var shop = ["eggs","fruits"]
 */
var someInt = [Int]()
print("someInt中含有\(someInt.count)个数据")

someInt.append(3)   //添加一个数据
//print(someInt)
someInt = []
//print(someInt)

var threeDoubles = Array(repeating: 0.1, count: 3)
//print(threeDoubles)

var anDoubles = Array(repeating: 5.1, count: 3)
//print(anDoubles)
var doubles = threeDoubles + anDoubles
//print(doubles)

var shop:[String] = ["eggs","fruits"]

//访问和修改数组
/*
 用.count来获取数组中的元素数量
 用.isEmpty来检查数组是否为空
 用append(_:)在数组后面添加新的数据
 直接用 += 在数组后面添加一个或多个数据
 可以通过下标来获取数据，也可以用下标来改变它的数据，甚至是一次改变一系列的数据
 用insert(_, at:)在具体下标前添加数据
 用remove(at: )删除具体下标下的数据
 用removeLast删除最后一个数据
 用removeAll删除所有数据
 */
print("shop中有\(shop.count)个元素")

if shop.isEmpty {
    print("shop是空的")
} else{
    print("shop里面有东西")
}

shop.append("hahah")
//print(shop)
shop += ["lala"]
//print(shop)
shop += ["fafa","nana","baba"]
print(shop)

shop[3...6] = ["huahua"]
print(shop)

shop.insert("first", at: 0)
print(shop)
let soc = shop.remove(at: 0)
print(shop,soc)
//shop.removeAll()
print(shop)

//数组的遍历
/*
 用 for-in 来遍历数组中的数据
 如果同时需要数据和下标，可以使用enumerated()方法来遍历，它返回一个有每一个数据和下标组成的元组
 */
for item in shop {
    print(item)
}

for (index, value) in shop.enumerated(){
    print("第\(index+1)项，值为\(value)")
}















