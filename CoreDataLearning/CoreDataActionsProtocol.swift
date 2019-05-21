//
//  CoreDataActionsProtocol.swift
//  CoreDataLearning
//
//  Created by Rahul Dhiman on 21/05/19.
//  Copyright © 2019 rahul. All rights reserved.
//
import Foundation
import CoreData

protocol CoreDataActions {
    associatedtype Entity:NSManagedObject
    static func results() -> [Entity]
    static func fetchRequest() -> NSFetchRequest<Entity>
    static func deleteObjects(_ objects:[Entity])
    static func truncate()
}
extension CoreDataActions {
    static func results() -> [Entity] {
        var res = [Entity]()
        do {
            try res = PresistanceService.context.fetch(fetchRequest())
        }
        catch { }
        return res
    }
    static func deleteObjects(_ objects:[Entity]) {
        objects.forEach{PresistanceService.context.delete($0)}
    }
    static func truncate() {
        deleteObjects(results())
        PresistanceService.saveContext()
        print("Person Entity Deleted all object successfully....")
    }
    
}
