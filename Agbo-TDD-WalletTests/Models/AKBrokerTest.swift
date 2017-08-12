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
    
    override func setUp() {
        super.setUp()
        broker = AKBroker ()
        fiveDollars = AKMoney(withAmount: 5, currency: "USD")
        fiveEuros = AKMoney(withAmount: 5, currency: "EUR")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testConvertionWithSameCurrency() {
        let total = broker.conver(money:fiveDollars,
                                  toCurrency:"USD")
        XCTAssertEqual(total, fiveDollars)
    }
    
    func testConversionWithDifferentCurrencies() {
        broker.addConversion(rate: 2,
                             fromCurrency: "USD",
                             toCurrency: "EUR")
        let tenDollars = fiveDollars.multiply(by: 2)
        let fiveConvertedEuros = broker.conver(money:tenDollars,
                                               toCurrency:"EUR")
        XCTAssertEqual(fiveConvertedEuros, fiveEuros)
    }
    
    func testThatNoRateRaisesException() {
        XCTAssertThrowsError(broker.conver(money:fiveDollars,
                                           toCurrency:"EUR"))
    }
    
    /*
     testNonValidConversion
     - currency
     */
}
