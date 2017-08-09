//
//  AKCurrencyTest.swift
//  AgboTDDWalletTests
//
//  Created by Andres Kwan on 8/9/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import XCTest
@testable import AgboTDDWallet

class AKCurrencyTest: XCTestCase {
    
    func testCurrency(){
        let fiveEuros = AKMoney(withAmount:5, currency:"EUR")
        XCTAssertEqual("EUR", fiveEuros.currency)
        let fiveDollars = AKMoney(withAmount:5, currency:"USD")
        XCTAssertEqual("USD", fiveDollars.currency)
    }
    
    func testDifferentCurrencies(){
        let fiveEuros = AKMoney(withAmount:5, currency:"EUR")
        let fiveDollars = AKMoney(withAmount:5, currency:"USD")
        XCTAssertNotEqual(fiveDollars, fiveEuros)
    }
}
