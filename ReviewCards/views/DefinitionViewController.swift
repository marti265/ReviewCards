//
//  DefinitionViewController.swift
//  ReviewCards
//
//  Created by Jose on 4/28/19.
//  Copyright © 2019 Jose. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController , UITextFieldDelegate, UINavigationControllerDelegate{    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var valueField: UITextView!
    @IBOutlet var dateLabel: UILabel!
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    

    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    //var item: Item!
    var item: Card! {
        didSet {
            navigationItem.title = item.name
            //navigationItem.title = item.valueDes
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.text = item.name
        //serialNumberField.text = item.serialNumber
        valueField.text = item.valueDes
        
        dateLabel.text = dateFormatter.string(from: item.dateCreated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Clear first responder
        view.endEditing(true)
        
        // "Save" changes to item
        item.name = nameField.text ?? ""
        item.valueDes = valueField.text ?? ""

    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}


