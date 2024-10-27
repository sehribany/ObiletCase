//
//  ProductCellViewModel.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 25.10.2024.
//

import Foundation

protocol ProductCellDataSource{
    var product: Product {get}
}

protocol ProductCellEventSource: AnyObject {}

protocol ProductCellProtocol: ProductCellDataSource, ProductCellEventSource {}

final class ProductCellViewModel: ProductCellProtocol{
    var product: Product
    
    init(product: Product) {
        self.product = product
    }
}
