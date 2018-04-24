//
//  ViewController.swift
//  iOSRecruitmentTest
//

import Foundation
import UIKit
import RxAlamofire
import RxSwift

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var coreDataManager = CoreDataManager.sharedInstance
    
    var itemArray: [Item]? {
        didSet {
            if itemArray != nil {
                coreDataManager.saveItemsToLocalDb()
                tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiController.sharedInstance.downloadAndSetItems(coreDataManager: coreDataManager, viewController: self)
        itemArray = (coreDataManager.getItemsFromLocalDb())
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ((itemArray != nil) ? itemArray!.count : 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.item = (itemArray != nil) ? itemArray?[indexPath.row] : nil
        return cell
    }
}
