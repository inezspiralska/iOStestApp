//
//  JsonItemConverter.swift
//  iOSRecruitmentTest
//

class JsonItemConverter{
    
    static let sharedInstance: JsonItemConverter = {
        let instance = JsonItemConverter()
        return instance
    }()
    
    func mapJsonToItems(dictionary:[[String: AnyObject]], localCoreDataManager: CoreDataManager?) -> [Item]{
        var itemArray : [Item] = []
        for dictItem in dictionary
        {
            let item = Item(context: (localCoreDataManager?.persistentContainer.viewContext)!)
            guard let itemName = dictItem["name"] as? String
                else { continue }
            item.name = itemName
            itemArray.append(item)
        }
        
        return itemArray
    }
}
