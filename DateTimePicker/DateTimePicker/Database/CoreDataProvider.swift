//
//  DataManager.swift
//  DateTimePicker
//
//  Created by Sakshi Patil on 05/02/2024.
//

import Foundation
import CoreData

// Manages Core Data operations
class DataManager {
    
    /// Shared DataManager.
    public static let shared = DataManager()
    
    /// The Core Data model.
    let model: String  = "DatePicker"
    
    // Lazy-initialized persistent container for Core Data.
    lazy var persistentContainer: NSPersistentContainer = {
        let messageKitBundle = Bundle(for:DataManager.self)
        let modelURL = messageKitBundle.url(forResource: self.model, withExtension: "momd")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
        let container = NSPersistentContainer(name: self.model, managedObjectModel: managedObjectModel!)
        let storeURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("\(self.model).sqlite")
        let options = [NSMigratePersistentStoresAutomaticallyOption: true,
                             NSInferMappingModelAutomaticallyOption: true]
        do {
            try container.persistentStoreCoordinator.addPersistentStore(
                ofType: NSSQLiteStoreType,
                configurationName: nil,
                at: storeURL,
                options: options)
        } catch {
            fatalError("Adding of store failed: \(error)")
        }
        return container
    }()
    
    // Saves changes in the view context of Core Data.
    func save () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Unresolved error \(error)")
            }
        }
    }
    
    // Inserts a new Employee object with the provided date and time string into Core Data.
    func insertDateTime(dateTime:String)  {
        let employee =  Employee(context: persistentContainer.viewContext)
        employee.check_in_date_time = dateTime
        save()
    }

    // Retrieves the most recent 'check_in_date_time' value from Core Data.
    func getLatestStoredTime() -> String? {
        let request: NSFetchRequest<Employee> = Employee.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "check_in_date_time", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        request.fetchLimit = 1
        var fetched: [Employee] = []
        do {
            fetched = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching latest time \(error)")
        }
        if  let employee =  fetched.first {
            return employee.check_in_date_time
        }
        return nil
    }
}
