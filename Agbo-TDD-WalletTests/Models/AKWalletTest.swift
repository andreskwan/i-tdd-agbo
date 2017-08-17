//
//  AKWalletTest.swift
//  AgboTDDWalletTests
//
//  Created by Andres Kwan on 8/12/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import XCTest
@testable import AgboTDDWallet

class AKWalletTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMultiplyAmount() {
        //how do I know if I need a protocol?
        //because you will need to understand and model your project
        
        //xcode should suggest me to create this class for me.
        let tenWalletDollars = AKWallet(withAmount: 10, currency: "USD")
        XCTAssertEqual(AKWallet(withAmount: 10, currency: "USD"),
                       tenWalletDollars)
    }
    
//    func testAdditionWithConvertion() {
//        var broker = AKBroker()
//        broker.addConversion(rate: 2, fromCurrency: "USD", toCurrency: "EUR")
//
//        let wallet = AKWallet(withAmount:40, currency:"EUR")
//        let oneHundredConvertedDollars = wallet.plus(other: AKWallet(withAmount: 20, currency: "USD"))
//
//        let totalMoneyInWallet = broker.conver(money: wallet,
//                                               toCurrency: "USD")
//        let oneHundredDollars = AKWallet(withAmount: 100, currency: "USD")
//        XCTAssertEqual(oneHundredDollars, totalMoneyInWallet)
//    }
    /*
     Working on this test to implement addition among different currencies
     */
    func testAdditionWithConvertion() {
        var broker = AKBroker()
        broker.addConversion(rate: 2, fromCurrency: "USD", toCurrency: "EUR")
        
        //wallet -> €40=$80
        let wallet = AKMoney(withAmount:40, currency:"EUR")
        //this addition is not possible yet!
        //wallet -> €40 + $40
        _ = wallet.plus(other: AKMoney(withAmount: 40,
                                       currency: "USD"))
        //wallet -> $120
        let _120convertedDollars = try! broker.conver(money: wallet,
                                                      toCurrency: "USD", convertable: ConvertWalletToMoney())
        let _120dollars = AKMoney(withAmount: 120, currency: "USD")
        XCTAssertEqual(_120dollars,
                       _120convertedDollars)
    }
}
