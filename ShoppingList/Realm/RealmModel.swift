//
//  RealmModel.swift
//  ShoppingList
//
//  Created by Kanghos on 2021/11/02.
//

import Foundation
import RealmSwift

class ShopListModel: Object {
    @Persisted var isChecked: Bool
    @Persisted var shopItem: String
    @Persisted var isBookmarked: Bool
    
    convenience init(shopItem:String){
        
        self.init()
        
        self.isChecked = false
        self.shopItem = shopItem
        self.isBookmarked = false
    }
}
