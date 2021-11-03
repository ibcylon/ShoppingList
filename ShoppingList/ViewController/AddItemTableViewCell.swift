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
    @IBOutlet weak var shopTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    //Closure
    var addButtonAction : (() -> ())?
    let localRealm = try! Realm()
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        addButton.layer.cornerRadius = 10
        addButton.addTarget(self, action: #selector(addButtonClicked(_:)), for: .touchUpInside)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func addButtonClicked(_ sender: UIButton) {
        //클로저 실행
        let task = ShopListModel(shopItem: shopTextField.text!)
        
        try! localRealm.write {
            localRealm.add(task)
        }
        addButtonAction?()
    }
}
