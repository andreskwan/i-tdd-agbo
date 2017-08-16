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
    //how to encapsulate properties in structs
    var amount : Double {get set}
    var currency : String {get set}
//    associatedtype Dinero
    
    init()
    func multiply(by times: Double) -> Self
    func plus(other: Self) -> Self
}
//MARK: Hashable
extension AKCurrency {
    var hashValue: Int {
        //it is the same if we are comparing a Dollar with an Euro!!!
        return amount.hashValue
    }
    static func ==(lhs: Self, rhs: Self) -> Bool {
        let isEqualAmount = lhs.amount == rhs.amount ? true : false
        let isEqualCurrency = lhs.currency == rhs.currency ? true : false
        return isEqualAmount && isEqualCurrency ? true : false
    }
}
//MARK: Default Behavior-Methods
extension AKCurrency {
    func plus(other: Self) -> Self {
        //should sheck if are the same currency
        if self.currency == other.currency {
            let total = self.amount + other.amount
            return Self(withAmount: total, currency: self.currency)
        }
        //should throw an exception if currencies are different
        //or should identify currencies rates and convert?
        //not this is the responsability of a AKBrocker
        return self
    }
    
    func multiply(by times: Double) -> Self {
        let amount = self.amount * times
        return Self(withAmount: amount, currency: self.currency)
    }
    
    func description() -> String {
        return "<\(type(of:self))>\n\(self.currency)-\(self.amount)"
    }
}
//MARK: Initializers
extension AKCurrency {
    init(withAmount initialAmount:Double, currency:String) {
        self.init()
        self.amount = initialAmount
        self.currency = currency
    }
}
