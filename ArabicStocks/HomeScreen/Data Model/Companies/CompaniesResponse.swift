//
//  CompaniesResponse.swift
//  ArabicStocks
//
//  Created by Yasmina Sobhi on 12/6/19.
//  Copyright © 2019 Yasmina. All rights reserved.
//

import Foundation


// MARK: - Welcome
class CompaniesResponse: Codable {
    let rows: [Company]?
    let numberOfPages: Int?
    let validCriteria: Bool?
}

// MARK: - Row
class Company: Codable {
    let name: String?
    let url: String?
    let market: String?
    let sector: String?
    let marketUrl: String?
    let currency: String?
    let profileUrl: String?
    let symbol: String?
    let price: Double?
    let changePercentage: Double?
    let lastUpdate: String?
}
