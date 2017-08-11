//
//  AKBroker.swift
//  AgboTDDWallet
//
//  Created by Andres Kwan on 8/10/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import Foundation

/*
 AKBroker should know coversion between
 */
struct AKBroker {
    
    func conver(money:AKMoney, toCurrency:String) -> AKMoney {
        if money.currency == toCurrency {
            return money
        }
        return AKMoney()
    }
}
