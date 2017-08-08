//
//  EuroTest.swift
//  Agbo-TDD-WalletTests
//
//  Created by Andres Kwan on 8/7/17.
//  Copyright © 2017 Andres Kwan. All rights reserved.
//

import XCTest
@testable import AgboTDDWallet

class EuroTest: XCTestCase {
    
    func testMultiplyAmount() {
        //how do I know if I need a protocol?
        //because you will need to understand and model your project
        
        //xcode should suggest me to create this class for me.
        var euroRightPocket = AKEuro(withAmount:5)
        let tenEuros = AKEuro(withAmount:10)
        euroRightPocket.multiplyAmount(by: 2)
        
        XCTAssertEqual(euroRightPocket, tenEuros)
    }
    
    func testEquality() {
        let euroLeftPocket = AKEuro(withAmount:10)
        let tenEuros = AKEuro(withAmount:10)
        
        XCTAssertEqual(euroLeftPocket, tenEuros)
    }
}
