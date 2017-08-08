//
//  AKCurrency.swift
//  AgboTDDWallet
//
//  Created by Andres Kwan on 8/7/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import Foundation

//AKCurrency Generic Constrain - Homogenety
protocol AKCurrency: Equatable {
    var amount : Double {get}
    init(withAmount initialAmount:Double)
    mutating func multiplyAmount(by times:Double)
}

extension AKCurrency {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.amount == rhs.amount ? true : false
    }
}
