//
//  ViewController.swift
//  Houston
//
//  Created by Sravani Nagunuri on 9/1/23.
//

import UIKit

class ViewController: UIViewController {

//    outlets
    @IBOutlet weak var cardImageIcon: UIImageView!
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var cardTextDescription: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    //properties
    var model: CardHub!
    var cardsArray: [CardHub]!
    var currentIndex: Int = 0
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        model = CardHub()
       cardsArray =  model.getAll()
        
        guard let card = cardsArray.first else { return }
        
        
                
        cardImageIcon.image = UIImage(systemName: card.imageName)
        cardTitle.text = String("CardName: \(card.cardName)")
        cardTextDescription.text = card.cardDescription.first
    }

    @IBOutlet weak var randomBtn: UIButton!
    @IBAction func randomCardBtnTapped(_ sender: Any) {
        
        print("randomCardBtnTapped")
    }
    
    //MARK: -
    @IBAction func randonCardTapped(_ sender: Any) {
        
        let randomNumber = Int.random(in: 0...2)
        cardImageIcon.image = UIImage(systemName: cardsArray[randomNumber].imageName )
        cardTitle.text = String("CardName: \(cardsArray[randomNumber].cardName)")
        cardTextDescription.text = cardsArray[randomNumber].cardDescription.first
        
    }
    
    @IBAction func nextCardBtnTapped(_ sender: Any) {
        currentIndex += 1
        if currentIndex == 3 {
            currentIndex = 0
        }
        cardImageIcon.image = UIImage(systemName: cardsArray[currentIndex].imageName)
        cardTitle.text = String("CardName: \(cardsArray[currentIndex].cardName)")
        cardTextDescription.text = cardsArray[currentIndex].cardDescription.first
    }
    
    @IBAction func cardSelectorBtnTapped(_ sender: Any) {
    
        
        let alert = UIAlertController(title: "Pick a topic", message: "", preferredStyle: .actionSheet)
        
        for i in ["UIAlertController", "UIKit", "ViewController"] {
            alert.addAction(UIAlertAction(title: i, style: .default, handler: {  [self]_ in
                DispatchQueue.main.async { [self] in
                    switch(i) {
                        case "UIAlertController":
                            self.cardImageIcon.image = UIImage(systemName: self.cardsArray[0].imageName)
                            self.cardTitle.text = String("CardName: \(self.cardsArray[0].cardName)")
                            cardTextDescription.text = cardsArray[0].cardDescription.first
                        case "UIKit":
                            cardImageIcon.image = UIImage(systemName: cardsArray[1].imageName)
                            cardTitle.text = String("CardName: \(cardsArray[1].cardName)")
                            cardTextDescription.text = cardsArray[1].cardDescription.first
                        case "ViewController":
                            cardImageIcon.image = UIImage(systemName: cardsArray[2].imageName)
                            cardTitle.text = String("CardName: \(cardsArray[2].cardName)")
                            cardTextDescription.text = cardsArray[2].cardDescription.first
                        default:
                            cardImageIcon.image = UIImage(systemName: cardsArray[0].imageName)
                            cardTitle.text = String("CardName: \(cardsArray[0].cardName)")
                            cardTextDescription.text = cardsArray[0].cardDescription.first
                            break

                    }
                }
                
                
                
            }))
            
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
}

