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
    var broker = AKBroker()
    var fiveDollars = AKMoney()
    var fiveEuros = AKMoney()
    var tenDollars = AKMoney()
    
    override func setUp() {
        super.setUp()
        broker = AKBroker ()
        fiveDollars = AKMoney(withAmount: 5, currency: "USD")
        fiveEuros = AKMoney(withAmount: 5, currency: "EUR")
        tenDollars = AKMoney(withAmount: 10, currency: "USD")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testConvertionWithSameCurrencies() {
        let fiveConvertedDollars = try! broker.conver(money:fiveDollars,
                                                      toCurrency:"USD")
        XCTAssertEqual(fiveConvertedDollars, fiveDollars)
    }
    
    func testConvertionWithDifferentCurrencies() {
        broker.addConversion(rate: 2,
                             fromCurrency: "USD",
                             toCurrency: "EUR")
        /// $10 to EUR
        let fiveConvertedEuros = try! broker.conver(money:tenDollars,
                                                    toCurrency:"EUR")
        XCTAssertEqual(fiveConvertedEuros, fiveEuros)
        
        /// €5 to USD
        let tenConvertedDollars = try! broker.conver(money:fiveEuros,
                                                    toCurrency:"USD")
        XCTAssertEqual(tenConvertedDollars, tenDollars)
    }
    
    func testThatNoRateRaisesException() {
        /// no rates
        XCTAssertThrowsError(try broker.conver(money:fiveDollars,
                                               toCurrency:"EUR"))
    }
    
    /*
     testNonValidConversion
     - currency
     */
}
