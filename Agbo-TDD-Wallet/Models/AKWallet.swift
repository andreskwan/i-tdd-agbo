//
//  AKWallet.swift
//  AgboTDDWallet
//
//  Created by Andres Kwan on 8/12/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import Foundation

/// It's purpose is to hold the money
struct AKWallet: AKCurrency {
    var amount: Double
    //it is going to have multiple currencies!!!
    //so what I'm going to do with this property?
    var currency: String
    
    var arrayToHoldAllCurencies = [AKMoney]()
    
    init() {
        amount = 0
        //this is not a valid currency, I need a test for that!
        currency = ""
    }
    
    init(withAmount initialAmount:Double, currency:String) {
        self.init()
        self.amount = initialAmount
        self.currency = currency
        
        let money = AKMoney(withAmount: self.amount,
                            currency: self.currency)
        
        arrayToHoldAllCurencies.append(money)
    }
    
    mutating func plus(other: AKMoney) -> AKWallet {
        arrayToHoldAllCurencies.append(other)
        return self
    }
    
    mutating func multiply(by times: Double) -> AKWallet {
        var array = [AKMoney]()
        for money in arrayToHoldAllCurencies {
            array.append(money.multiply(by: times))
        }
        arrayToHoldAllCurencies = array
        return self
    }
}

