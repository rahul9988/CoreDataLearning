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
        Person.truncate()
        
//        let filter = Person.results().filter{$0.password!.contains("**")}
        //filter.map({$0.password = "****"})
//        PresistanceService.saveContext()

    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        
        LocationManager.shared.getLiveLocationUpdates { (loc, str) in
            print(str)
            let person = Person(context: PresistanceService.context)
            let idx = (Int.random(in: 1111...9999))
            person.id = idx

            person.name = "rahul-\(idx)"
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 9.0) {
            self.fetch()
           // self.saveData() // does not save if app is in back ground. will get save when it come in foreground.
        }
    }
    func saveData(){
        if Person.results().count == 0 {
            for _ in 1...999 {
                let person = Person(context: PresistanceService.context)
                person.name = "rahul-\(Int.random(in: 1111...9999))"
                person.password = "rd\(Int.random(in: 100...999))"
            }
            PresistanceService.saveContext()
        } else {
            fetch()
        }
    }
    func fetch() {
        let results = Person.results()
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

