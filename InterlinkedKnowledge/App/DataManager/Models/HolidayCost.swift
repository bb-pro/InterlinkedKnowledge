//
//  HolidayCost+CoreDataProperties.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 25/3/2024.
//
//

import Foundation
import CoreData

@objc(HolidayCost)
public class HolidayCost: NSManagedObject {

}

extension HolidayCost {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HolidayCost> {
        return NSFetchRequest<HolidayCost>(entityName: "HolidayCost")
    }

    @NSManaged public var name: String?
    @NSManaged public var cost: Int32

}

extension HolidayCost : Identifiable {

}
