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
    
    init()
    func multiply(by times:Double) -> Self
    func plus(other:Self) -> Self
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
//    func multiply(by times:Double) -> Self {
//        self.amount *= Double(times)
//        return self
//    }
    
//    func plus(money:Self) -> Self {
//        //should sheck if are the same currency
//        if self.currency == money.currency {
//            let total = self.amount + money.amount
//            let valor = init(withAmout:total, currency: self.currency)
//            return valor
//        }
//        //should throw an exception if currencies are different
//        return self
//    }
    
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
