//
//  ApiController.swift
//  iOSRecruitmentTest
//

import Foundation
import RxSwift
import RxAlamofire

class ApiController {
    
    static let sharedInstance: ApiController = {
        let instance = ApiController()
        return instance
    }()
    
    func downloadAndSetItems(coreDataManager: CoreDataManager, viewController: ViewController) {
        let sourceStringURL = ApiConfig.URLString("/items")
        RxAlamofire.requestJSON(.get, sourceStringURL)
                    .subscribe(
                        onNext: { [weak self] (r, json) in
                            if 200 ..< 300 ~= r.statusCode
                            {
                                if let dictionary = json as? [[String: AnyObject]]
                                {
                                    let itemArray = JsonItemConverter.sharedInstance.mapJsonToItems(dictionary: dictionary, localCoreDataManager: coreDataManager)
                                    viewController.itemArray = itemArray
                                }
                            }
                        }, onError:
                        {
                            (error) in
                            //TODO: error pop up
                            print("error occured!")
                    }, onCompleted: nil, onDisposed: nil)
    }
}
