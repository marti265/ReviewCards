//
//  CardsView.swift
//  ReviewCards
//
//  Created by Jose on 4/15/19.
//  Copyright © 2019 Jose. All rights reserved.
//

//import Foundation
import UIKit
class Card: NSObject {
    
    //card class variables
    var name: String
    var valueDes: String
    let dateCreated: Date
    
    //initialze name, discription and date created
    init(name: String, valueDes: String) {
        self.name = name
        self.valueDes = valueDes
        self.dateCreated = Date()
        super.init()
    }
    
    //setup an array of vocabulary
    convenience init(random: Bool = false) {
        if random {
            //array of words
            let adjectives = ["Untitled"]
            //count of array
            let idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]
            let randomName = "\(randomAdjective)"
            //display format
            self.init(name: randomName, valueDes: "")
        } else {
            //else display empty format
            self.init(name: "", valueDes: "")
        }
    }
}
