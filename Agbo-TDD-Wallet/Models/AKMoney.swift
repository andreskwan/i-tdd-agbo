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
        currency = "USD"
    }
}
