//
//  Card.swift
//  ConcentrationGame
//
//  Created by Puneet Mahali on 13.06.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var uid: Int
    
    static var uidFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        uidFactory += 1
        return uidFactory
    }
    
    init() {
        self.uid = Card.getUniqueIdentifier()
    }
}
