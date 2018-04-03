//
//  main.swift
//  practice2
//
//  Created by Cseventh on 2018/4/3.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation
//类型属性
/*
 为类型本身定义属性，无论创建了多少个该类型的实例，这些属性都只有唯一一份。（而实例之间的属性相互独立）————可以理解为C语言里的静态常量
 因为类型本身没有构造器所以*必须*给*存储型类型属性*指定默认值。
 存储型类型属性是延迟初始化的，并且不需要对其使用‘lazy’修饰符
 类型属性通过类型本身使用点运算符来访问，而不是通过实例
 */
struct SomeStructure {
    static var storeTP = "一些值"
    static var computedTP : Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storeTP = "一些值"
    static var computedTP : Int {
        return 6
    }
}
class SomeClass {
    static var storeTP = "一些值"
    static var computedTP : Int {
        return 27
    }
    class var overrideableComputedTP: Int {
        return 107
    }
}
print(SomeStructure.storeTP)
SomeStructure.storeTP = "CsCsCs"
print(SomeStructure.storeTP)
print(SomeEnumeration.computedTP)
print(SomeClass.computedTP)

struct AudioChannel {
    static let ThresholdLevel = 10
    static var  maxInputLevelForAllChannels = 0
    var currentLevel : Int = 0 {
        didSet{
            if currentLevel > AudioChannel.ThresholdLevel{
                currentLevel = AudioChannel.ThresholdLevel //这里对‘currentLevel’值的设置不会使观察器再次被调用
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftAudio = AudioChannel()
var rightAudio = AudioChannel()
leftAudio.currentLevel = 7
print(leftAudio.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

rightAudio.currentLevel = 11
print(rightAudio.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
