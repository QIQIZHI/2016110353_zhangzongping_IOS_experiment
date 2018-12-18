//
//  Concentration.swift
//  实验七
//
//  Created by zhangzongping on 2018/11/23.
//  Copyright © 2018年 zongpingzhang. All rights reserved.
//

import Foundation
class Concentration
{
    //所有卡片的数组
    var cards = [Card]()
    //记录是否有一张而且仅有一张卡朝上的卡片的索引，类型为可选类型
    var indexOfOneAndOnlyFaceUpCard: Int?
    //匹配成功时加分标准
    var addPoint = false
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard,matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    addPoint = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfParisOfCards: Int){
        for _ in 0..<numberOfParisOfCards{
            let card = Card()
//            cards.append(card)
//            cards.append(card)
            //下列式子等价于注释
            cards += [card,card]
        }
        // TODO:Shuffle the cards
        cards.sort{_,_ in arc4random_uniform(2)>0}
    }
}
