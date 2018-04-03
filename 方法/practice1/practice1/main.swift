//
//  main.swift
//  practice1
//
//  Created by Cseventh on 2018/4/3.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation
//方法
//类型方法
/*
 在方法的‘func’关键字之前加上关键字‘static’，来指定类型方法。
 在类型方法的方法图值班费，‘self’指向这个类型本身。
 
 ？？
 一般来说，在类型方法的方法体中，任何未限定的方法和属性名称，可以被本类中其他的类型方法和类型属性引用。一个类型方法可以直接通过类型方法的名称调用本类中的其他类型方法，而无需再方法名称前面加上类型名称。类型地，在结构体和枚举中，也能够直接通过类型属性的名称访问本类中的类型属性，而不需要前面加上类型名称。
 ？？
 */
struct LevelTraker {
    static var highestUnlocked = 1
    var currebtLevel = 1
    
    static func unlock(_ level: Int){
        if level > highestUnlocked{
            highestUnlocked = level
        }
    }
    
    static func isUnlocked (_ level : Int) -> Bool{
        return level <= highestUnlocked
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool{
        if LevelTraker.isUnlocked(level){
            currebtLevel = level
            return true
        }else{
            return false
        }
    }
}

class Player {
    var tracker = LevelTraker()
    let playerName : String
    func complete(level: Int) {
        LevelTraker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "CC")
player.complete(level: 1)
print("现在最高等级为\(LevelTraker.highestUnlocked)")

player = Player(name: "Cq")
if player.tracker.advance(to: 6){
    print("现在等级为6")
}else{
    print("等级6还未解锁")
}
