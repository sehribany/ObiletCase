//
//  HomeViewModel.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 9.10.2024.
//

import Foundation

protocol HomeViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> ProductCellProtocol
}

protocol HomeViewEventSource {
    var didSuccessFetchProduct: VoidClosure? { get set }
    var didFailWithError: StringClosure?     { get set }
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    func showProductDetailScreen(at indexPath: IndexPath)
}

final class HomeViewModel: BaseViewModel, HomeViewProtocol{
    var didSuccessFetchProduct: VoidClosure?
    var didFailWithError      : StringClosure?
    var cellItems             : [ProductCellViewModel] = []
    var title                 : String?
    private let productService = ProductService()
    
    func showProductDetailScreen(at indexPath: IndexPath) {
        let product = cellItems[indexPath.row]
    }
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> ProductCellProtocol {
        return cellItems[indexPath.row]
    }
}

extension HomeViewModel{
    
    func fetchProduct() {
        productService.fetchProducts { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let products):
                self.cellItems = products.map { ProductCellViewModel(product: $0) }
                self.didSuccessFetchProduct?()
            case .failure(let error):
                self.didFailWithError?(error.localizedDescription)
            }
        }
    }
    
    func fetchProductsByCategory(_ category: Category) {
        productService.fetchProductsByCategory(category) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let products):
                print(result)
                self.cellItems = products.map { ProductCellViewModel(product: $0) }
                self.didSuccessFetchProduct?()
            case .failure(let error):
                self.didFailWithError?(error.localizedDescription)
            }
        }
    }
}
