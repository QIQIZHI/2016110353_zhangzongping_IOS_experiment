//
//  Card.swift
//  实验七
//
//  Created by zhangzongping on 2018/11/23.
//  Copyright © 2018年 zongpingzhang. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
