//
//  ShoppingListTableViewCell.swift
//  ShoppingList
//
//  Created by Kanghos on 2021/11/02.
//

import UIKit
import RealmSwift

class ShoppingListTableViewCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var shopItemLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    var isChecked:Bool = false
    var isBookMarked:Bool = false
    
    let localRealm = try! Realm()
    var tasks:Results<ShopListModel>!
    
    static let identifier = "ShoppingListTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tasks = localRealm.objects(ShopListModel.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        //키보드 처리
    }
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        isChecked = !isChecked
        if isChecked {
            checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal )
        } else {
            checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
    }
    
    @IBAction func bookmarkButtonClicked(_ sender: UIButton) {
        isBookMarked = !isBookMarked
        
        if isBookMarked {
            bookmarkButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            bookmarkButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    
    
}
