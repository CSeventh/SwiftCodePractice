//
//  main.swift
//  practice1
//
//  Created by user on 2018/3/14.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation
//条件语句

/*
 元组的对应位置可以用“.0”“.1”来表示
 */

let sp = (1, 1)
switch sp {
case (0,0):
    print("(0,0)1")
case (_,0):
    print("(\(sp.0),0)22")
case (0,_):
    print("(0,\(sp.1))333")
case (-2...2,-2...2):
    print("(\(sp.0),\(sp.1))4444")
default:
    print("(\(sp.0),\(sp.1))55555")
}
		
//值绑定
let anoP = (2,2)
switch anoP {
case (let x , 0):
        print("绑定的值x为\(x)")
case (0,let y):
        print("绑定的值y为\(y)")
case let (x,y):
        print("绑定的xy值为\((x,y))")
}

//用where来判断额外的条件
let yAP = (1, -15)
switch yAP {
case let (x,y) where x == y:
    print("x == y")
case let (x,y) where x == -y:
    print("x == -y")
case let (x,y):
    print("没有关系")
}

//复合匹配
/*
 当多个条件可以使用同一种方法来处理时，可以将这几种可能放在同一个case后面，并且用逗号隔开
 需要注意：复合匹配里所有的匹配模式，都必须包含相同的值绑定
 */
