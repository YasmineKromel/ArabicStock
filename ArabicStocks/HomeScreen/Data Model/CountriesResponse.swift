//
//  CountriesResponse.swift
//  ArabicStocks
//
//  Created by Yasmina Sobhi on 12/6/19.
//  Copyright © 2019 Yasmina. All rights reserved.
//

import Foundation

// MARK: - WelcomeElement
class Country: Codable {
    let name, dialCode, code: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case dialCode = "dial_code"
        case code
    }
    
    init(name: String, dialCode: String, code: String) {
        self.name = name
        self.dialCode = dialCode
        self.code = code
    }
}

