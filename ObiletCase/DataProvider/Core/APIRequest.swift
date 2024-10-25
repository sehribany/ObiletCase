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
    case getProductsByCategory(Category)
    
    var path: String {
        switch self {
        case .getProduct: return APIEndpoint.products.rawValue
        case .getProductsByCategory(let category) : return APIEndpoint.category(category).rawValue
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getProduct, .getProductsByCategory: return .get 
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
