//
//  AKCurrency.swift
//  AgboTDDWallet
//
//  Created by Andres Kwan on 8/7/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import Foundation

//AKCurrency Generic Constrain - Homogenety
protocol AKCurrency: Hashable {
    var amount : Double {get set}
    init()
    mutating func multiply(by times:Double)
}

extension AKCurrency {
    var hashValue: Int {
        //it is the same if we are comparing a Dollar with an Euro!!!
        return amount.hashValue
    }
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.amount == rhs.amount ? true : false
    }
}

extension AKCurrency {
    mutating func multiply(by times:Double) {
        self.amount *= Double(times)
    }
    
    func description() -> String {
        return "Name: \(type(of:self))\nAmount: \(self.amount)"
    }
    
    init(withAmount initialAmount:Double) {
        self.init()
        self.amount = initialAmount
    }
}
