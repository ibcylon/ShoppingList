//
//  ShoppingTableViewController.swift
//  ShoppingList
//
//  Created by Kanghos on 2021/11/02.
//

import UIKit
import RealmSwift

class ShoppingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let localRealm = try! Realm()
    var tasks : Results<ShopListModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //XIB 등록
        let nibName = UINib(nibName: ShoppingListTableViewCell.identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: ShoppingListTableViewCell.identifier)
        
        //Realm objects
        tasks = localRealm.objects(ShopListModel.self)
        
        uiInitialize()
        
        
        //addButton.addTarget(self, action: #selector(addTask), for: .touchUpInside)
    }
    
    func uiInitialize(){
        view.tintColor = .black
                
    }
    @objc func addTask(){
        //let task = ShopListModel(shopItem: shopTextField.text!)
        
//        try! localRealm.write {
//            localRealm.add(task)
//            tableView.reloadData()
//        }
    }
}

extension ShoppingViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        if section == 0 {
            return 1
        } else if section == 1 {
            return tasks.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //아이템 추가 섹션
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AddItemTableViewCell.identifier, for: indexPath) as? AddItemTableViewCell else {
                return UITableViewCell()
            }
            
            //클로저에서 실행될 코드 삽입
            cell.addButtonAction = { 
                tableView.reloadData()
                
            }
            
            return cell
            
        } else {
        //리스트 섹션
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingListTableViewCell.identifier, for: indexPath) as?
                    ShoppingListTableViewCell else {
                        return UITableViewCell()
                    }
            let row = tasks[indexPath.row]
            cell.isChecked = row.isChecked
            cell.isBookMarked = row.isBookmarked
            cell.shopItemLabel.text = row.shopItem
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView.numberOfSections == 0 {
            return 80
        } else {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        try! localRealm.write {
            localRealm.delete(tasks[indexPath.row])
            
            tableView.reloadData()
        }
    }
    
    
}
