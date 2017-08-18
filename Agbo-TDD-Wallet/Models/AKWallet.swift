//
//  AKWallet.swift
//  AgboTDDWallet
//
//  Created by Andres Kwan on 8/12/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import Foundation

/// It's purpose is to hold the money
struct AKWallet {
    var arrayToHoldAllCurencies : [AKMoney]
    
    init() {
        arrayToHoldAllCurencies = [AKMoney]()
    }
    
    mutating func plus(other: AKMoney) {
        arrayToHoldAllCurencies.append(other)
    }
}

