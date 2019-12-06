//
//  HomeEndPoint.swift
//  ArabicStocks
//
//  Created by Yasmina Sobhi on 12/6/19.
//  Copyright © 2019 Yasmina. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum HomeEndPoint {
    case companies(code: String)
}

extension HomeEndPoint: TargetType{
    
    var baseURL: URL {
        switch self {
        case .companies:
            return URL(string: K.Urls.baseUrl)!
        }
    }
    
    var path: String {
        switch self {
        case .companies:
            return ""
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .companies:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .companies(let id):
            return ["country":id]
        }
    }
    var task: Task {
        switch self {
        case .companies:
            return .requestParameters(parameters: parameters!, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .companies:
            return ["Content-Type": "application/json"]
        }
    }
    
    
}
