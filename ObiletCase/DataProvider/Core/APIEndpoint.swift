//
//  APIEndpoint.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 9.10.2024.
//

import Foundation

// MARK: - APIEndpoint
enum APIEndpoint {
    case products
    case category(Category)
    
    var rawValue: String {
        switch self {
        case .products:
            return "/products"
        case .category(let category):
            return "/products/category/\(category.rawValue)"
        }
    }
    
    func url() -> String {
        return APIConstants.baseURL + self.rawValue
    }
}
