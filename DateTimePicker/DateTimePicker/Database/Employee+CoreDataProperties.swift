//
//  Employee+CoreDataProperties.swift
//  DateTimePicker
//
//  Created by Sakshi Patil on 05/02/2024.
//
//

import Foundation
import CoreData


extension Employee {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }
    
    @NSManaged public var check_in_date_time: String?
    
}

extension Employee : Identifiable {
    
}
