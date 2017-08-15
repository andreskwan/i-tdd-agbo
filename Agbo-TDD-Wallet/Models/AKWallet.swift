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
    var currency: String
    
    var arrayToHoldAllCurencies //: <T:AKCurrency>
    
    init() {
        amount = 0
        //this is not a valid currency, I need a test for that!
        currency = ""
    }
}

