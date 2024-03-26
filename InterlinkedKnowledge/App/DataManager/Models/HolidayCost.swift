//
//  HolidayCost+CoreDataProperties.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 25/3/2024.
//
//

import Foundation
import CoreData



extension HolidayCost {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HolidayCost> {
        return NSFetchRequest<HolidayCost>(entityName: "HolidayCost")
    }

    @NSManaged public var name: NSObject?
    @NSManaged public var cost: Int32

}

extension HolidayCost : Identifiable {

}
