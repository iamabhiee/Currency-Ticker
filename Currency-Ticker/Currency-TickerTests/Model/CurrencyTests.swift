//
//  CurrencyTests.swift
//  Currency-Ticker
//
//  Created by Abhishek Sheth on 13/08/16.
//  Copyright © 2016 Abhishek. All rights reserved.
//

import XCTest

@testable import Currency_Ticker

class CurrencyTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit_ShouldTakeNameCodeAndSymbol() {
        let currencyName = "Indian Rupee"
        let currencyCode = "INR"
        let currencySymbol = "₹"
        
        let currency = Currency(name : currencyName, code : currencyCode, symbol : currencySymbol)
        
        XCTAssertEqual(currency.name, currencyName, "Initializer should set the name")
        XCTAssertEqual(currency.code, currencyCode, "Initializer should set the code")
        XCTAssertEqual(currency.symbol, currencySymbol, "Initializer should set the symbol")
    }
    
    func testEqualCurrency_ShouldBeEqual() {
        let firstCurrencyName = "Indian Rupee"
        let firstCurrencyCode = "INR"
        let firstCurrencySymbol = "₹"
        
        let secondCurrencyName = "Indian Rupee"
        let secondCurrencyCode = "INR"
        let secondCurrencySymbol = "₹"
        
        let firstCurrency = Currency(name : firstCurrencyName, code : firstCurrencyCode, symbol : firstCurrencySymbol)
        let secondCurrency = Currency(name : secondCurrencyName, code : secondCurrencyCode, symbol : secondCurrencySymbol)
        
        XCTAssertEqual(firstCurrency, secondCurrency, "should be same currency")
    }
    
    func testDifferentNames_ShouldNotBeEqual() {
        testDifferentProperties_ShouldNotBeEqual("Indian Rupee", secondName: "Australian Dollar", firstCode: "INR", secondCode: "INR", firstSymobol: "₹", secondSymbol: "₹")
    }
    
    func testDifferentCodes_ShouldNotBeEqual() {
        testDifferentProperties_ShouldNotBeEqual("Indian Rupee", secondName: "Indian Rupee", firstCode: "INR", secondCode: "AUD", firstSymobol: "₹", secondSymbol: "₹")
    }
    
    func testDifferentSymbol_ShouldNotBeEqual() {
        testDifferentProperties_ShouldNotBeEqual("Indian Rupee", secondName: "Indian Rupee", firstCode: "INR", secondCode: "INR", firstSymobol: "₹", secondSymbol: "$")
    }
    
    func testDifferentProperties_ShouldNotBeEqual(firstName : String, secondName : String, firstCode : String, secondCode : String, firstSymobol : String, secondSymbol : String, line: UInt = #line) {
        let firstCurrency = Currency(name : firstName, code : firstCode, symbol : firstSymobol)
        let secondCurrency = Currency(name : secondName, code : secondCode, symbol : secondSymbol)
        
        XCTAssertNotEqual(firstCurrency, secondCurrency, "should not be same currency", line : line)
    }
    
    func testStoredCurrency_ShouldBeSame() {
        let userDefaultKey = "TEST_CURRENCY"
        let firstCurrency = Currency(name : "Indian Rupee", code : "INR", symbol : "₹")
        
        NSUserDefaults.standardUserDefaults().setObject(firstCurrency.encode(), forKey: userDefaultKey)
        
        if let storedCurrencyDictionary = NSUserDefaults.standardUserDefaults().objectForKey(userDefaultKey) as? Dictionary<String, String> {
            let storedCurrency = Currency(dictionary : storedCurrencyDictionary)
            XCTAssertEqual(firstCurrency, storedCurrency, "should be same currency")
        } else {
            XCTAssert(false)
        }
        
        NSUserDefaults.standardUserDefaults().removeObjectForKey(userDefaultKey)
    }
}
