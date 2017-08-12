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
enum AKBrokerErrors : Error {
    case NoConversionRateException
}
struct AKBroker {
    var rates:[String:Double] = [:]
    
    func conver(money:AKMoney,
                toCurrency:String) throws -> AKMoney
    {
        if money.currency != toCurrency {
            let rateConversionKey = key(from: money.currency,
                                        toCurrency: toCurrency)
            guard let rate = rates[rateConversionKey] else {
                throw AKBrokerErrors.NoConversionRateException
            }
            let newAmount = money.amount/rate
            return AKMoney(withAmount: newAmount,
                           currency: toCurrency)
        }
        return money
    }
    
    mutating func addConversion(rate: Double,
                                fromCurrency:String,
                                toCurrency:String)
    {
        //does the dictionary allow to create the same key twice?
        rates[fromCurrency + " to " + toCurrency] = rate
        rates[toCurrency + " to " + fromCurrency] = 1/rate
    }
    
    func key(from currency:String, toCurrency: String) -> String
    {
        return currency + " to " + toCurrency
    }
}
