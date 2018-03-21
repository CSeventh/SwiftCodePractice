//
//  main.swift
//  practice2
//
//  Created by user on 2018/3/21.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation
//直接退出
/*
 guard可以看成是if，不同点在于guard后面必须有一个else从句，如果条件不为真则执行else从句中的代码
 将变量或者常量的可选绑定作为guard语句的条件，都可以保护guard语句后面的代码                     ？？？保护代码？
 */
func greet(person: [String: String]){                   //自定义函数
    guard let name = person["name"] else {              //没有名字就直接return
        return
    }
    print("Hello \(name)")
    guard let location = person["location"] else {      //没给地址的话说完这句就return
        print("you are so nice everyday")
        return
    }
    print("我希望\(location)的天气还不错")                  //有地址，所有祝你那儿天气晴朗~
}
greet(person: ["name":"嘟嘟"])
greet(person: ["name":"花花","location":"长沙"])
