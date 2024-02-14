//
//  Employee+CoreDataProperties.swift
//  DateTimePicker
//
//  Created by pritam bolenwar on 14/02/2024.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var check_in_date_time: String?
    @NSManaged public var name: String?

}

extension Employee : Identifiable {

}
