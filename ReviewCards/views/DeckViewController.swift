//
//  ItemsViewController.swift
//  ItemsView
//
//  Created by Jose Martinez on 3/19/19.
//  Copyright © 2019 Jose. All rights reserved.
//

import UIKit
import Firebase


class DeckViewController: UITableViewController{
    //Table View Cell file to a variable
    var deck: Deck!
    

    //var ref: FirebaseApp! = nil
    
    let db = FirebaseApp.app()
    
    
    
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return deck.allItems.count
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a new or recycled cell
        
        //CHANGE FROM:
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",
         for: indexPath)*/
        //TO:
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = deck.allItems[indexPath.row]
        
        /* CHANGE FROM:
         cell.textLabel?.text = item.name
         cell.detailTextLabel?.text = "$\(item.valueInDollars)"
         
         TO: */
        // Configure the cell with the Item
        cell.nameLabel.text = item.name
        cell.valueLabel.text = item.valueDes
        
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get the height of the status bar
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
        
    }
    
    //@IBAction func addNewItem(_ sender: UIButton) {
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        // Create a new item and add it to the store
        let newItem = deck.createItem()
        // Figure out where that item is in the array
        if let index = deck.allItems.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let item = deck.allItems[indexPath.row]
            // Remove the item from the store
            
            let title = "Delete \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                             handler: { (action) -> Void in
                                                // Remove the item from the store
                                                self.deck.removeItem(item)
                                                //self.imageStore.deleteImage(forkey: item.itemKey)
                                                // Also remove that row from the table view with an animation
                                                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            // Present the alert controller
            present(ac, animated: true, completion: nil)
            
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        // Update the model
        deck.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showItem" segue
        switch segue.identifier {
        case "showDef"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                // Get the item associated with this row and pass it along
                let item = deck.allItems[row]
                let detailViewController
                    = segue.destination as! DefinitionViewController
                detailViewController.item = item
                //detailViewController.imageStore = imageStore
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
}
