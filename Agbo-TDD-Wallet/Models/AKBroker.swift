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
    var rates:[String:Int] = [:]
    
    func conver(money:AKMoney,
                toCurrency:String) -> AKMoney {
        if money.currency != toCurrency {
            let rateConversionKey = key(from: money.currency, toCurrency: toCurrency)
            //validate if the key is in the dictionary
            if let index = rates.index(forKey: rateConversionKey) {
                let rate = rates[index]
                let newAmount = money.amount / Double(rate.value)
                return AKMoney(withAmount: newAmount,
                               currency: toCurrency)
            }
        }
        return money
    }
    
    mutating func addConversion(rate: Int, 
                                fromCurrency:String,
                                toCurrency:String) {
        //does the dictionary allow to create the same key twice?
        rates[fromCurrency + " to " + toCurrency] = rate
    }
    
    func key(from currency:String, toCurrency: String) -> String {
        return currency + " to " + toCurrency
    }
}
