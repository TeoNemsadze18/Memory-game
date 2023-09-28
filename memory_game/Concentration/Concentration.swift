//
//  Concentration.swift
//  Standford
//
//  Created by teona nemsadze on 22.09.23.
//

import Foundation

struct Concentration {
  private(set)  var cards = [Card]()
    
   private var indexOfOneOnlyFaceUpCard: Int? {
        get {
            let ch = "h".oneAndOnly
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
           // return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                        if foundIndex == nil {
//                            foundIndex = index
//                        } else {
//                            return nil
//                        }
//                    }
//                }
//                return foundIndex
        }
          set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
   mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concetration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concetration.init(\(numberOfPairsOfCards)):you musy have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
           cards += [card, card]
           }
        }
    }
    extension Collection {
        var oneAndOnly: Element? {
            return count == 1 ? first : nil
    }
}






