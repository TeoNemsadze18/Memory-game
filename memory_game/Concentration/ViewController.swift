//
//  ViewController.swift
//  Standford
//
//  Created by teona nemsadze on 19.09.23.
//

import UIKit

class ViewController: UIViewController {

    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
   
  var numberOfPairsOfCards: Int {
            return(cardButtons.count+1) / 2
        
    }
   private(set) var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
     
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeWidth: 5.0,
            .strokeColor : #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        ]
        let attrubutedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attrubutedString
        }
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
   
    
    @IBAction private func touchCard(_ sender: UIButton) {
        
        flipCount += 1
    if let cardNumber = cardButtons.index(of: sender) {

            game.chooseCard(at: cardNumber) 
            updateViewFromModel()
    } else {
        print("chosen card was not in cardButton")
         }
    }
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
        }
    }
    
 // private  var emojiChoices = ["🎃", "👻", "❄️", "☠️", "🧜‍♀️", "🧚🏾", "👀", "🫀", "🦄"]
    private  var emojiChoices = "🎃👻❄️☠️🧜‍♀️🧚🏾👀🫀🦄"
     
  private  var emoji = [Card:String]()
      
  private  func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
            }
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
 





