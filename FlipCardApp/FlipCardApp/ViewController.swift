//
//  ViewController.swift
//  FlipCardApp
//
//  Created by Abylbek Khassenov on 9/9/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit
 
class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsCard: (CardButtons.count + 1) / 2)
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var CardButtons: [UIButton]!
    @IBAction func touchCard(_ sender: UIButton) {
        if let numberOfCard = CardButtons.firstIndex(of: sender){
            game.chooseCard(at: numberOfCard)
            updateViewFromModel()
        }else{
            print("This button is not connetcted")
        }
        flipCount += 1
    }
    func updateViewFromModel(){
        for index in CardButtons.indices{
            let button = CardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for : card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.4474533796, green: 0.7865040898, blue: 0.9586818814, alpha: 0)  : #colorLiteral(red: 0.4474533796, green: 0.7865040898, blue: 0.9586818814, alpha: 1)
            }
        }
    }
    var listOfEmoji = ["🍺","🧞‍♂️","🧛‍♀️","☃️","💧","🏄🏼‍♂️"]
    var emoji = [Int : String]()
    func emoji(for card : Card )->String{
            if listOfEmoji.count > 0 , emoji[card.identifier] == nil{
                let randomIndex = Int(arc4random_uniform(UInt32(listOfEmoji.count)))
                emoji[card.identifier] = listOfEmoji.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}
