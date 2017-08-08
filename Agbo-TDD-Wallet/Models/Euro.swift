//
//  Euro.swift
//  Agbo-TDD-Wallet
//
//  Created by Andres Kwan on 8/7/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import Foundation

struct Euro {
    private var amount : Double
    init(withAmount initialAmount:Double) {
        amount = initialAmount
    }
    
    mutating func multiplyAmount(by times:Int) {
     self.amount *= Double(times)
    }
}

extension Euro: Equatable {
    static func ==(lhs: Euro, rhs: Euro) -> Bool {
        return lhs.amount == rhs.amount ? true : false
    }
}
