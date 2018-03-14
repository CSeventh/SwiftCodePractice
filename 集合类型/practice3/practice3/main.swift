//
//  main.swift
//  practice3
//
//  Created by user on 2018/3/14.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

//字典

//字典类型简化语法
/*
 
 */
//var test1: [Int: String]
//var test2 = Int: String               //这是书上的

var test = Dictionary<Int,String>()     //书上的方法呢？？？
print(test)
test[16] = "sixteen"
print(test)
test[15] = "fifteen"
print(test)
test = [:]
print(test)

//用字典字面量创建字典
/*
 字典字面量是一种讲一个或多个键值对写作Dictionary集合的快捷途径
 
 */
var air: [String: String] = ["YYZ":"T P","DUB":"Dbl"]
print(air)

//访问和修改字典
/*
 用count来获取字典中的数据量
 用isEmpty来检查count是否为0
 直接使用下标语法来添加数据或者改变特定的值
 updateValue(_:forKey)方法可以设置或者更新特定键对应的值，若不存在会设置新值，如果存在，则返回更新之前的原值
 用下标语法来获取键对应的值
 用小标语法对键的对应值赋值为nil来移除一个键值对
 可以用removeValue(forKey:)来删除键值对，键值对存在将会被移除并返回移除的值，否则返回nil
 */
print("air字典中有\(air.count)个数据")

if air.isEmpty {
    print("对对对，我是空的")
} else {
    print("你才是空的，你全家都空的")
}
air["LQ"] = "GKjy"
print(air)
air["DUB"] = "wanynhg"
print(air)

if let old = air.updateValue("dilidili", forKey: "YYZ"){
    print(air)
    print("YYZ原来的值为\(old)")
}

if let airname = air["YYZ"]{
    print("YYZ现在叫~\(airname)")
}else{
    print("木有这个东西")
}
print(air)

air["YYZ"] = nil
print(air)

if let removed = air.removeValue(forKey: "YYZ"){
    print("我删除了\(removed)")
} else {
    print("没有这个东西我怎么删！")
}
print(air)

//字典遍历
/*
 用for-in遍历字典中的键值对，每一个数据项都以(key,value)元组形式返回，我们也可以用临时敞亮或者变量来分解这些元组
 也可以通过单独访问keys或者values属性来获取值或者键
 如果还是需要使用字典的键集合或者值集合来作为一个Array用于别处，可以直接使用keys或者values属性构造一个新数组
 */
for (Kkkkk,Vvvvv) in air{
    print((Kkkkk,Vvvvv))
}

for kkkk in air.keys{
    print("\(kkkk)是air的值")
}
for vvvv in air.values{
    print("\(vvvv)是air的键")
}

let kkkk = [String](air.values)
let vvvv = [String](air.keys)
print(kkkk)
print(vvvv)
		
