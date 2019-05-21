//
//  Person+CoreDataProperties.swift
//  CoreDataLearning
//
//  Created by Rahul Dhiman on 21/05/19.
//  Copyright © 2019 rahul. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {
    class func results() -> [Person] {
        var res = [Person]()
        do {
            try res = PresistanceService.context.fetch(fetchRequest())
        }
        catch { }
        return res
    }
    class func deleteObjects(_ objects:[Person]) {
        objects.forEach{PresistanceService.context.delete($0)}
    }
    class func truncate() {
        deleteObjects(results())
    }
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }
    
    @NSManaged public var id: Int
    @NSManaged public var name: String
    @NSManaged public var password: String
    @NSManaged public var cards: NSSet?
    @NSManaged public var fakeCards: NSSet?
    
}

// MARK: Generated accessors for cards
extension Person {
    
    @objc(addCardsObject:)
    @NSManaged public func addToCards(_ value: Card)
    
    @objc(removeCardsObject:)
    @NSManaged public func removeFromCards(_ value: Card)
    
    @objc(addCards:)
    @NSManaged public func addToCards(_ values: NSSet)
    
    @objc(removeCards:)
    @NSManaged public func removeFromCards(_ values: NSSet)
    
}

// MARK: Generated accessors for fakeCards
extension Person {
    
    @objc(addFakeCardsObject:)
    @NSManaged public func addToFakeCards(_ value: Card)
    
    @objc(removeFakeCardsObject:)
    @NSManaged public func removeFromFakeCards(_ value: Card)
    
    @objc(addFakeCards:)
    @NSManaged public func addToFakeCards(_ values: NSSet)
    
    @objc(removeFakeCards:)
    @NSManaged public func removeFromFakeCards(_ values: NSSet)
    
}
