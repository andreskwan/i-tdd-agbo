//
//  AKBroker.swift
//  AgboTDDWallet
//
//  Created by Andres Kwan on 8/10/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import Foundation

enum AKConvetionErrors : Error {
    case NoConversionRateException
}

struct AKBroker {
    var rates:[String:Double] = [:]
//    var convertable:CustomCurrencyConvertible = ConvertMoneyToMoney()
//    
//    mutating func set(convertable:CustomCurrencyConvertible){
//        self.convertable = convertable
//    }
    //should throw if convertable is not set
//    func conver(money:AKMoney,
//                              toCurrency:String,
//                              convertable:CustomCurrencyConvertible) throws -> AKMoney
//    {
//        return try convertable.conver(money: money,
//                                      toCurrency: toCurrency,
//                                      rates: rates)
//    }
    
    func conver(money:AKMoney,
                toCurrency:String) throws -> AKMoney
    {
        var newAmount = money.amount
        if money.currency != toCurrency {
            let rateConversionKey = key(from: money.currency,
                                        toCurrency: toCurrency)
            guard let rate = rates[rateConversionKey] else {
                throw AKConvetionErrors.NoConversionRateException
            }
            newAmount = money.amount/rate
        }
        return AKMoney(withAmount: newAmount, currency: toCurrency)
    }
    
    func conver(wallet:[AKMoney],
                toCurrency:String) throws -> AKMoney
    {
        var total = AKMoney(withAmount: 0, currency: toCurrency)
        for money in wallet {
            total = total.plus(other: try self.conver(money: money,
                                                      toCurrency: toCurrency))
        }
        return total
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
