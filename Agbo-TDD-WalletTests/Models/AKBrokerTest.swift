//
//  AKBrokerTest.swift
//  AgboTDDWalletTests
//
//  Created by Andres Kwan on 8/10/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import XCTest
@testable import AgboTDDWallet

class AKBrokerTest: XCTestCase {
    
    func testSimpleCurencyConvertion() {
        let broker = AKBroker()
        let fiveDollars = AKMoney(withAmount: 5, currency: "USD")

        let total = broker.conver(money:fiveDollars, toCurrency:"USD")
        XCTAssertEqual(total, fiveDollars)
        
    }
    
    func testConversionBetweenCurrencies() {
        let broker = AKBroker()
        let tenDollars = AKMoney(withAmount: 10, currency: "USD")
        let fiveEuros = AKMoney(withAmount: 5, currency: "EUR")
        
        broker.addConversion(rate:2, fromCurency:"USD", toCurrency:"EUR")
        let total = broker.conver(money:tenDollars, toCurrency:"EUR")
        XCTAssertEqual(total, fiveEuros)
    }
    
    /*
     var rates:[String:Int]
     
     
     testNonValidConversion
     - currency
     */
}
