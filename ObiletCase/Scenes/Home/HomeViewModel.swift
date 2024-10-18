//
//  HomeViewModel.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 9.10.2024.
//

import Foundation

final class HomeViewModel: BaseViewModel{
    
    private let productService = ProductService()
    private(set) var products: [Product] = []
    var didUpdateProducts: VoidClosure?
    var didFailWithError: StringClosure?
    
    func fetchProducts() {
        productService.fetchProducts { [weak self] result in
            switch result {
            case .success(let products):
                self?.products = products
                self?.didUpdateProducts?()
            case .failure(let error):
                self?.didFailWithError?(error.localizedDescription)
            }
        }
    }
}
