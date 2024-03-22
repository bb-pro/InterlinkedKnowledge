//
//  Holiday+CoreDataProperties.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 22/3/2024.
//
//

import Foundation
import CoreData


extension Holiday {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Holiday> {
        return NSFetchRequest<Holiday>(entityName: "Holiday")
    }

    @NSManaged public var name: String?
    @NSManaged public var cost: Int16
    @NSManaged public var date: Date?
    @NSManaged public var purchases: String?

}

extension Holiday : Identifiable {

}
