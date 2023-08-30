//
//  Step+CoreDataProperties.swift
//  CoreDataTask
//
//  Created by Tony Chen on 9/5/2023.
//
//

import Foundation
import CoreData


extension Step {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Step> {
        return NSFetchRequest<Step>(entityName: "Step")
    }

    @NSManaged public var name: String?
    @NSManaged public var stepNum: String?
    @NSManaged public var task: NSOrderedSet?

}

// MARK: Generated accessors for task
extension Step {

    @objc(insertObject:inTaskAtIndex:)
    @NSManaged public func insertIntoTask(_ value: Task, at idx: Int)

    @objc(removeObjectFromTaskAtIndex:)
    @NSManaged public func removeFromTask(at idx: Int)

    @objc(insertTask:atIndexes:)
    @NSManaged public func insertIntoTask(_ values: [Task], at indexes: NSIndexSet)

    @objc(removeTaskAtIndexes:)
    @NSManaged public func removeFromTask(at indexes: NSIndexSet)

    @objc(replaceObjectInTaskAtIndex:withObject:)
    @NSManaged public func replaceTask(at idx: Int, with value: Task)

    @objc(replaceTaskAtIndexes:withTask:)
    @NSManaged public func replaceTask(at indexes: NSIndexSet, with values: [Task])

    @objc(addTaskObject:)
    @NSManaged public func addToTask(_ value: Task)

    @objc(removeTaskObject:)
    @NSManaged public func removeFromTask(_ value: Task)

    @objc(addTask:)
    @NSManaged public func addToTask(_ values: NSOrderedSet)

    @objc(removeTask:)
    @NSManaged public func removeFromTask(_ values: NSOrderedSet)

}

extension Step : Identifiable {

}
