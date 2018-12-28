//
//  Person+CoreDataProperties.swift
//  CoreDataLearning
//
//  Created by Rahul Dhiman on 12/18/18.
//  Copyright © 2018 rahul. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }
    class func results() -> [Person] {
        var res = [Person]()
        do {
            try res = PresistanceService.context.fetch(fetchRequest())
        }
        catch { }
        return res
    }
    class func deleteObjects(_ objects:[Person]) {
        objects.forEach({PresistanceService.context.delete($0)})
    }
    class func truncate() {
        deleteObjects(results())
    }
    @NSManaged public var name: String?
    @NSManaged public var password: String?

}
