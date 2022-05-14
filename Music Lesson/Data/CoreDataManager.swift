//
//  DatabaseManager.swift
//  Music Lesson
//
//  Created by Jonas Wallmann on 23.02.22.
//

import Foundation
import CoreData

struct CoreDataManager {
    
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "Database")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("!!!Error loading Core Data.!!! \(error)")
            }
        }
        context = container.viewContext
    }
}
