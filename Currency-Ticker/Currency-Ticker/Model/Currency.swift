//
//  Currency.swift
//  Currency-Ticker
//
//  Created by Abhishek Sheth on 13/08/16.
//  Copyright © 2016 Abhishek. All rights reserved.
//

import Foundation

struct Currency : Equatable {
    var name : String
    var code : String
    var symbol : String
    
    init(name : String, code : String, symbol : String) {
        self.name = name
        self.code = code
        self.symbol = symbol
    }
    
    init(dictionary: Dictionary<String, String>){
        name = dictionary["name"]!
        code = dictionary["code"]!
        symbol = dictionary["symbol"]!
    }
    
    func encode() -> Dictionary<String, String> {
        let dictionary = ["name" : name, "code" : code, "symbol" : symbol]
        return dictionary
    }
}

func ==(lhs: Currency, rhs: Currency) -> Bool {
    
    if lhs.name != rhs.name {
        return false
    }
    
    if lhs.code != rhs.code {
        return false
    }
    
    if lhs.symbol != rhs.symbol {
        return false
    }
    
    return true
}