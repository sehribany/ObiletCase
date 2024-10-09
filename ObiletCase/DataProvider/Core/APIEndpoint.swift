//
//  APIEndpoint.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 9.10.2024.
//

import Foundation

// MARK: - APIEndpoint
enum APIEndpoint: String {
    case products = "/products"
    case categories = "/products/categories"
    
    func url() -> String {
        return APIConstants.baseURL + self.rawValue
    }
}
