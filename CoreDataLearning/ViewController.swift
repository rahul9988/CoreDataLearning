//
//  ViewController.swift
//  CoreDataLearning
//
//  Created by Rahul Dhiman on 12/18/18.
//  Copyright © 2018 rahul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        fetch()
        //Person.truncate()
        
//        let filter = Person.results().filter{$0.password!.contains("**")}
        //filter.map({$0.password = "****"})
//        PresistanceService.saveContext()

    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        
        //saveData()
    }
    func saveData(){
        LocationManager.shared.getLiveLocationUpdates { (loc, str) in
            print(str)
            let person = Person(context: PresistanceService.context)
            let idx = UUID().uuidString
            person.id = idx
            person.name = "rahul"
            person.password = str
            
            let card = Card(context: PresistanceService.context)
            card.id = "id-453534"
            card.name = "HDFC"
            card.number = (Int64.random(in: 1111_1111_1111_1111...9999_9999_9999_9999))
            
            let fakecard = Card(context: PresistanceService.context)
            fakecard.id = "id-xxxx"
            fakecard.name = "XX"
            fakecard.number = 0420_0420_0420_0420
            
            person.addToCards(card)
            person.addToFakeCards(fakecard)
            PresistanceService.saveContext()
            
        }
    }
    func fetch() {
        let results = Person.results()
        print("=============>>>>>>>>>>")
        print(results.count)
        results.forEach{
            print("id - \($0.id) = name - \($0.name) : password - \($0.password)")
            let person = $0
            print("Card")

            person.cards?.forEach{ cardAny in
                if let card = cardAny as? Card {
                    print(card.name)
                    print(card.number)
                    print(card.id)
//                    print(card.cardOwner?.name)
                }
            }
            print("Fake Card")

            person.fakeCards?.forEach{ cardAny in
                if let card = cardAny as? Card {
                    print(card.name)
                    print(card.number)
                    print(card.id)
//                    print(card.cardOwner?.name)
                    
                }
            }
        }

    }

}

