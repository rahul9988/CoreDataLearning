//
//  Card+CoreDataProperties.swift
//  CoreDataLearning
//
//  Created by Rahul Dhiman on 21/05/19.
//  Copyright © 2019 rahul. All rights reserved.
//
//

import Foundation
import CoreData


extension Card {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    @NSManaged public var name: String
    @NSManaged public var number: Int64
    @NSManaged public var id: String

}
