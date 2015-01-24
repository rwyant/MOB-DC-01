//
//  Player.swift
//  Assessment 3
//
//  Created by Tedi Konda on 1/23/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import Foundation

class Player {
    var name: String = ""
    var hand: Int = 0
    var money: Int = 500
    init (hand: Int) {
        self.hand = hand
    }
}