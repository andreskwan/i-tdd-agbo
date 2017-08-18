//
//  AKCustomCurrencyConvertible.swift
//  AgboTDDWallet
//
//  Created by Andres Kwan on 8/17/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import Foundation

/*
 AKBroker should know coversion between
 */
enum AKConvetionErrors : Error {
    case NoConversionRateException
}

protocol CustomCurrencyConvertible {

    /// The generic constraing AKCurrency indicates that this method could act
    /// on any type that conforms the protocol AKCUrrency
    /// - Parameters:
    ///   - money: Any type that conforms AKCurrency
    ///   - toCurrency: String that represents a currency
    ///   - rates: <#rates description#>
    /// - Returns: A type that implements AKCurrency
    /// - Throws: if there is not a valid rate for conversion between currencies
    func conver<T:AKCurrency>(money:T,
                              toCurrency:String,
                              rates:[String:Double]) throws -> T
}
extension CustomCurrencyConvertible {
    func key(from currency:String, toCurrency: String) -> String
    {
        return currency + " to " + toCurrency
    }
}

struct ConvertMoneyToMoney:CustomCurrencyConvertible {
    func conver<T:AKCurrency>(money:T,
                              toCurrency:String,
                              rates:[String:Double]) throws -> T
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
        return T(withAmount: newAmount, currency: toCurrency)
    }
}

//struct ConvertWalletToMoney:CustomCurrencyConvertible {
//    func conver<T:AKCurrency>(money:T,
//                              toCurrency:String,
//                              rates:[String:Double]) throws -> T
//    {
//        var newAmount = money.amount
//        T.arrayToHoldAllCurencies
//        if money.currency != toCurrency {
//            let rateConversionKey = key(from: money.currency,
//                                        toCurrency: toCurrency)
//            guard let rate = rates[rateConversionKey] else {
//                throw AKConvetionErrors.NoConversionRateException
//            }
//            newAmount = money.amount/rate
//        }
//        return T(withAmount: newAmount, currency: toCurrency)
//    }
//}

