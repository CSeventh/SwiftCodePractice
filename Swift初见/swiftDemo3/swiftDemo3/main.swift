//
//  main.swift
//  swiftDemo3
//
//  Created by user on 2018/3/7.
//  Copyright © 2018年 user. All rights reserved.
//

import Foundation

//枚举
enum Rank : Int{
    case Ace = 1
    case Two, Three, Four, Five, Six, Seveen, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case.Jack:
            return "jack"
        case.Queen:
            return "queen"
        case.King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
print(ace , aceRawValue)

//使用init?(rawValue:)初始化构造器在原始值和枚举值之间进行转换
if let convertedRank = Rank(rawValue: 3){
    let threeDescription = convertedRank.simpleDescription()
}

//没有比较有意义的原始值，就不需要提供原始值
enum Suit{
    case Spades,Hearts,Doamonds,Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Doamonds:
            return "doamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescriptiom = hearts.simpleDescription()
print(hearts , heartsDescriptiom)

//考虑从服务器获取日出和日落时间。服务器会返回正常结果或者错误信息
enum ServerResponse {
    case Result(String,String)
    case Failure(String)
}

let success = ServerResponse.Result("6am", "8.09pm")
let failure = ServerResponse.Failure("Out of cheese")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = ß"Sunrise is at\(sunrise) and sunset is at\(sunset)"
case let .Failure(massage):
    print("Failure...   \(massage)")
}                                               //这里要怎么调用？
print(success,failure)


//用struct来创建结构体，结构体与类相似：结构图为传值，类为传引用。
struct Card {//结构体传入两个枚举
    var rank : Rank
    var suit : Suit
    func simpleDescription() -> String{
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOdSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescropyion = threeOdSpades.simpleDescription()
print(threeOdSpades,threeOfSpadesDescropyion)
		
