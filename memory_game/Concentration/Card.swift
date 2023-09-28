//
//  Card.swift
//  Standford
//
//  Created by teona nemsadze on 22.09.23.
//

import Foundation

struct Card: Hashable {
    var HashValue: Int { return identifier}
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    
  private  static var identifierFactory = 0
    
   private static func getUniqueIdentifiable() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifiable()
    }
}
