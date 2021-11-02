//
//  AddItemTableViewCell.swift
//  ShoppingList
//
//  Created by Kanghos on 2021/11/02.
//

import UIKit
import RealmSwift

class AddItemTableViewCell: UITableViewCell {

    static let identifier = "addItemCell"
    @IBOutlet weak var shoptextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    let localRealm = try! Realm()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        addButton.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func addButtonClicked(_ sender: UIButton) {
        
        addTask()
        
    }
    
    func addTask(){
        let task = ShopListModel(shopItem: shoptextField.text!)
        
        try! localRealm.write {
            localRealm.add(task)
        }
    }
    
}
