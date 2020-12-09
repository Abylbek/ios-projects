//
//  Concentration.swift
//  FlipCardApp
//
//  Created by Abylbek Khassenov on 9/10/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import Foundation
class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCar : Int?
    func chooseCard(at index : Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCar , index != matchIndex{
                if cards[index].identifier == cards[matchIndex].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCar = nil
            }else{
                    for flipDownIndex in cards.indices {
                        cards[flipDownIndex].isFaceUp = false
                    }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCar = index
                }
            }
        }
    init(numberOfPairsCard : Int) {
        for _ in 1...numberOfPairsCard{
            let card = Card()
            cards += [card , card]
        }
        cards.shuffle()
    }
}
