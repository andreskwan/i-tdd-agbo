//
//  AKMoney.swift
//  AgboTDDWallet
//
//  Created by Andres Kwan on 8/9/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import Foundation

struct AKMoney: AKCurrency {
    var amount: Double
    var currency: String
    init() {
        amount = 0
        currency = ""
    }
    
    func plus(other:AKMoney) -> AKMoney {
        //should sheck if are the same currency
        if self.currency == other.currency {
            let total = self.amount + other.amount
            return AKMoney(withAmount: total, currency: self.currency)
        }
        //should throw an exception if currencies are different
        //or should identify currencies rates and convert?
        //not this is the responsability of a AKBrocker
        return self
    }
    
    func multiply(by times:Double) -> AKMoney {
        let amount = self.amount * Double(times)
        return AKMoney(withAmount: amount, currency: self.currency)
    }
}
