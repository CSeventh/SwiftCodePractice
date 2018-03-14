//
//  main.swift
//  practice2
//
//  Created by user on 2018/3/12.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

//集合

//基本操作
/*
 用数组字面量来构造集合，并且可以使用简化形式写一个或者多个值作为集合元素
 Set类型不能从数组字面量中被单独推断出来，所以Set类型必须显式声明
    如果你想使用一个数组字面量构造一个Set并且该数组字面量中的所有元素类型相同，那么可以不用写出数据类型
    29行可改为  var fav: Set = ["b","c","d"]
 */
var letters = Set<Character>()
print("\(letters.count)个数据")
print(letters)

letters.insert("a")
print(letters)

letters = []        //现在是空的，但是数据类型不变

var fav: Set<String> = ["b","c","d"]
print(fav)

//访问和修改集合
/*
 只读属性count获得Set中元素的数量
 isEmpty检查count是否为0
 remove(_:)方法添加一个新元素，如果存在则删除，并且返回其值，否则返回nil
 removeAll删除所有元素
 contains(_:)方法检车Set中是否包含一个特定的值
 */
print("集合中有\(fav.count)个数据")

if fav.isEmpty {
    print("空的")
} else {
    print("不是空的")
}

fav.insert("e")
print(fav)

if let removed = fav.remove("c"){
    print("\(removed)被删除了")
} else{
    print("没有这个东西")
}
print(fav)

if fav.contains("d") {
    print("这里有！")
}else{
    print("没有没有")
}


//遍历一个集合
/*
 可以用for-in遍历一个Set中所有的值
 Set没有确定的顺序，排序可以使用sorted()方法，他会返回一个有序数组（通过'<'来对元素进行比较）
 */
for ffff in fav {
    print(ffff)
}

for ffff in fav.sorted() {
    print(ffff)
}


//其他操作
/*
 使用intersection(_:)方法根据两个集合中都包含的值创建一个新的集合
 使用symmetricDifference(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合
 使用union(_:)方法根据两个集合的值创建一个新的集合
 使用subtracting(_:)方法根据不在该集合中的值创建一个新的集合
 */
let qiShu: Set = [1,3,5,7,9]
let ouShu: Set = [0,2,4,6,8]
let suShu: Set = [2,3,5,7,11]
print(qiShu.intersection(suShu).sorted())               //A且B
print(qiShu.symmetricDifference(suShu).sorted())        //A非B或非AB
print(qiShu.union(ouShu).sorted())                      //A并B
print(qiShu.subtracting(suShu).sorted())                //不在suShu中的值


//集合成员关系和相等
/*
 使用“是否相等”运算符“==”来判断两个集合是否包含全部相同的值
 使用isSubset(of:)方法来判断一个集合中的值是否也被包含在另外一个集合中
 使用isSuperset(of:)方法判断一个集合中是否包含另一个集合中所有的值
 使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另一个集合的子集或者父集，且不相等
 使用isDisjoint(with:)方法来判断两个集合是否不含有相同的值（是否没有交集）.
 */
let set1: Set = ["1","2"]
let set2: Set = ["1","2","3","4","5"]
let set3: Set = ["3","4",]
print(set1.isSubset(of: set2))              //set1是否被set2包含
print(set2.isSuperset(of: set1))            //set2是否包含set1
print(set3.isStrictSubset(of: set2))        //set3是否是set2的子集
print(set1.isDisjoint(with: set3))          //是否没有交集
