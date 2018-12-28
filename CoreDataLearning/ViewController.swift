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
        //Person.truncate()
        if Person.results().count == 0 {
            for index in 1...999 {
                let person = Person(context: PresistanceService.context)
                person.name = "rahul-\(Int.random(in: 1111...9999))"
                person.password = "rd\(Int.random(in: 100...999))"
                
                PresistanceService.saveContext()
            }
        } else {
            fetch()
        }
        let filter = Person.results().filter{$0.password!.contains("**")}
        //filter.map({$0.password = "****"})
        PresistanceService.saveContext()

    }
    
    func fetch() {
        let results = Person.results()
        results.forEach({print("\($0.name!) - \($0.password!)")})
    }

}

