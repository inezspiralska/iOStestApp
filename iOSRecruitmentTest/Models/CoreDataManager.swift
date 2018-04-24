//
//  CoreDataManager.swift
//  iOSRecruitmentTest
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    static let sharedInstance: CoreDataManager = {
        let instance = CoreDataManager()
        return instance
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "iOSRecruitmentTest")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func getItemsFromLocalDb() -> [Item]{
        
        var itemArray : [Item] = []
            let context = persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
            fetchRequest.returnsObjectsAsFaults = false
            do{
                itemArray = try context.fetch(fetchRequest) as! [Item]
            }catch{
                print("error")
            }
        return itemArray
    }
    
    func saveItemsToLocalDb() {
        saveContext()
    }

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch let error as NSError {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
