//
//  AKBroker.swift
//  AgboTDDWallet
//
//  Created by Andres Kwan on 8/10/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import Foundation

struct AKBroker {
    var rates:[String:Double] = [:]
//    var convertable:CustomCurrencyConvertible = ConvertMoneyToMoney()
//    
//    mutating func set(convertable:CustomCurrencyConvertible){
//        self.convertable = convertable
//    }
    //should throw if convertable is not set
    func conver<T:AKCurrency>(money:T,
                              toCurrency:String,
                              convertable:CustomCurrencyConvertible) throws -> T
    {
        return try convertable.conver(money: money,
                                      toCurrency: toCurrency,
                                      rates: rates)
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
