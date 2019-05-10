//
//  ItemStore.swift
//  ItemsView
//
//  Created by Jose Martinez on 3/19/19.
//  Copyright © 2019 Jose. All rights reserved.
//

import UIKit
class Deck {
    var allItems = [Card]()
    
    func removeItem(_ item: Card) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }
    
    @discardableResult func createItem() -> Card {
        let newItem = Card(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        } // Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        // Remove item from array
        allItems.remove(at: fromIndex)
        // Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
}
