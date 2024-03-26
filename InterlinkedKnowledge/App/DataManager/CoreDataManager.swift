//
//  CoreDataManager.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 22/3/2024.
//

import UIKit
import CoreData

public final class CoreDataManager: NSObject {
    public static let shared = CoreDataManager()
    private override init() {}
    
    private var appDelegate: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
    
    private var context: NSManagedObjectContext? {
        return appDelegate?.persistentContainer.viewContext
    }
    
    //MARK: - Holiday
    
    // Create a new holiday entity
    public func createHoliday(name: String, cost: Int16, date: Date, purchases: String) {
        guard let unwrappedContext = context,
              let holidayEntityDescription = NSEntityDescription.entity(forEntityName: "Holiday", in: unwrappedContext) else {
            return
        }
        
        let holiday = Holiday(entity: holidayEntityDescription, insertInto: unwrappedContext)
        holiday.name = name
        holiday.cost = cost
        holiday.date = date
        holiday.purchases = purchases
        
        appDelegate?.saveContext()
    }
    
    // Fetch all holidays
    public func fetchHolidays() -> [Holiday] {
        let fetchRequest = NSFetchRequest<Holiday>(entityName: "Holiday")
        
        do {
            if let fetchedObjects = try context?.fetch(fetchRequest) {
                return fetchedObjects
            } else {
                print("Failed to fetch objects")
            }
        } catch {
            print("Error during fetchHolidays: \(error)")
        }
        
        return []
    }
    
    // Delete a holiday
    public func deleteHoliday(_ holiday: Holiday) {
        context?.delete(holiday)
        appDelegate?.saveContext()
    }
    
    // Edit a holiday
    public func editHoliday(_ holiday: Holiday, name: String, cost: Int16, date: Date, purchases: String) {
        holiday.name = name
        holiday.cost = cost
        holiday.date = date
        holiday.purchases = purchases
        
        appDelegate?.saveContext()
    }
    
    // MARK: - HolidayCost
    
    public func createHolidayCost(name: String, cost: Int32) {
        guard let unwrappedContext = context,
              let holidayEntityDescription = NSEntityDescription.entity(forEntityName: "HolidayCost", in: unwrappedContext) else {
            return
        }
        
        let holiday = HolidayCost(entity: holidayEntityDescription, insertInto: unwrappedContext)
        holiday.name = name
        holiday.cost = cost
        
        appDelegate?.saveContext()
    }
    
    // Fetch all holidayCosts
    public func fetchHolidayCosts() -> [HolidayCost] {
        let fetchRequest = NSFetchRequest<HolidayCost>(entityName: "HolidayCost")
        
        do {
            if let fetchedObjects = try context?.fetch(fetchRequest) {
                return fetchedObjects
            } else {
                print("Failed to fetch objects")
            }
        } catch {
            print("Error during fetchHolidays: \(error)")
        }
        
        return []
    }
    
    public func deleteAllEntities<T: NSManagedObject>(_ entityType: T.Type) {
            let fetchRequest = NSFetchRequest<T>(entityName: String(describing: entityType))
            
            do {
                if let fetchedObjects = try context?.fetch(fetchRequest) {
                    for object in fetchedObjects {
                        context?.delete(object)
                    }
                    appDelegate?.saveContext()
                } else {
                    print("Failed to fetch objects")
                }
            } catch {
                print("Error during deleteAllEntities: \(error)")
            }
        }
    
}


