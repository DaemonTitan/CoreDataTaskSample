//
//  Task+CoreDataProperties.swift
//  CoreDataTask
//
//  Created by Tony Chen on 9/5/2023.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var createDate: Date?
    @NSManaged public var title: String?
    @NSManaged public var step: Step?

}

extension Task : Identifiable {

}
