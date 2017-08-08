//
//  Euro.swift
//  Agbo-TDD-Wallet
//
//  Created by Andres Kwan on 8/7/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import Foundation

struct AKEuro:AKCurrency {
    internal var amount : Double
    init(withAmount initialAmount:Double) {
        amount = initialAmount
    }
}
