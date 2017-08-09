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
    
self.currency = "EUR"        let fiveEuros = AKMoney(euroWith: 5)
        XCTAssertEqual("EUR", fiveEuros.currency)
        let fiveDollars = AKMoney(dollarWith: 5)
        XCTAssertEqual("USD", fiveDollars.currency)
    }
}
