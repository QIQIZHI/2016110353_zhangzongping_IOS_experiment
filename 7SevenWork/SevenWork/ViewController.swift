//
//  ViewController.swift
//  实验七
//
//  Created by zhangzongping on 2018/11/23.
//  Copyright © 2018年 zongpingzhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game: Concentration = Concentration(numberOfParisOfCards: (cardButtons.count+1)/2)
    //得分情况
    @IBOutlet weak var flipCountLabel: UILabel!
    //所有卡片关联的出口，所有卡片的集合
    @IBOutlet var cardButtons: [UIButton]!
    //加分
    var scores = 0 { didSet { flipCountLabel.text = "Scores : \(scores)" } }
    //所有UIButton所关联的action
    @IBAction func touchCard(_ sender: UIButton) {
        //点击卡片开始
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("chosen card was no in the cardButtons")
        }
        
    }
    //从模型更新视图,如果点击没翻的卡片则翻出
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if(card.isFaceUp){
                button.setTitle(emoji(for: card),for:UIControlState.normal)
                button.backgroundColor = UIColor.white
                //匹配成功则加分
                if game.addPoint{
                    scores += 10
                    game.addPoint = false
                }
            }else{
                button.setTitle("",for:UIControlState.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : #colorLiteral(red: 1, green: 0.5285960501, blue: 0.1228347408, alpha: 1)
            }
        }
    }

    @IBAction func restartGame(_ sender: UIButton) {
        for index in cardButtons.indices{
            game.cards[index].isMatched = false
            game.cards[index].isFaceUp = false
            cardButtons[index].setTitle("",for:UIControlState.normal)
            cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 0.5285960501, blue: 0.1228347408, alpha: 1)
        }
        scores = 0
        
    }
    var emojiChoices = ["🐳","🌚","🌏","🌝","🍟","⚽️","🌽","🍩"]
    var emoji = [Int:String]()
    
    func emoji(for card:Card)->String{
        if emoji[card.identifier] == nil,emojiChoices.count > 0{
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

