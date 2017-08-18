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
        /// $5 to USD = $5
        let fiveConvertedDollars = try! broker.conver(money:fiveDollars,
                                                      toCurrency:"USD")
        XCTAssertEqual(fiveConvertedDollars, fiveDollars)
        /// €5 to EUR = €5
        let fiveConvertedEuros = try! broker.conver(money:fiveEuros,
                                                    toCurrency:"EUR")
        XCTAssertEqual(fiveConvertedEuros, fiveEuros)
    }
    
    func testConvertionWithDifferentCurrencies() {
        broker.addConversion(rate: 2,
                             fromCurrency: "USD",
                             toCurrency: "EUR")
        /// $10 to EUR = €5
        let fiveConvertedEuros = try! broker.conver(money:tenDollars,
                                                    toCurrency:"EUR")
        XCTAssertEqual(fiveConvertedEuros, fiveEuros)
        
        /// €5 to USD = $10
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
    
        func testMultipleConvertions() {
            var broker = AKBroker()
            broker.addConversion(rate: 2, fromCurrency: "USD", toCurrency: "EUR")
    
            //wallet -> €40=$80
            var wallet = [AKMoney]()
            //this addition is not possible yet!
            //wallet -> €40 + $40
            let fortyEuro = AKMoney(withAmount: 40,
                                       currency: "EUR")
            wallet.append(fortyEuro)
            wallet.append(AKMoney(withAmount: 40, currency: "USD"))
            print("-----------------wallet.count: \(wallet.count)")
            //wallet -> $120
            let _120convertedDollars = try! broker.conver(wallet: wallet,
                                                          toCurrency: "USD")
            let _120dollars = AKMoney(withAmount: 120, currency: "USD")
            XCTAssertEqual(_120dollars,
                           _120convertedDollars)
        }

}
