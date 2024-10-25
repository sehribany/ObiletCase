//
//  ProductService.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 9.10.2024.
//

import Foundation

// MARK: - Product Service
class ProductService{
    
    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        RequestManager.shared.performRequest(request: APIRequest.getProduct) { (result: Result<[Product], Error>) in
            completion(result)
        }
    }
    
    func fetchProductsByCategory(_ category: Category, completion: @escaping (Result<[Product], Error>) -> Void) {
        RequestManager.shared.performRequest(request: APIRequest.getProductsByCategory(category)) { (result: Result<[Product], Error>) in
            completion(result)
        }
    }
}
