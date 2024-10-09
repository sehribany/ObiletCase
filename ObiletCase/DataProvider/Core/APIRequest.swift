//
//  APIRequestAdapter.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 9.10.2024.
//

import Alamofire

// MARK: - APIRequest
enum APIRequest: RequestProtocol {
    case getProduct
    case getCategory
    
    var path: String {
        switch self {
        case .getProduct: return APIEndpoint.products.rawValue
        case .getCategory: return APIEndpoint.categories.rawValue
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getProduct, .getCategory: return .get
        }
    }
    
    var parameters: [String: Any] {
        return [:]
    }
    
    var headers: [String: String] {
        return ["Content-Type": "application/json"]
    }
    
    var encoding: RequestEncoding {
        return .url
    }
        
    var url: String {
        return APIConstants.baseURL + path
    }
}
