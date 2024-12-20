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
    var didSelectProduct: ((Product) -> Void)? { get set }
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    func showProductDetailScreen(at indexPath: IndexPath)
}

//MARK: - HomeViewModel
final class HomeViewModel: BaseViewModel, HomeViewProtocol{
    var didSelectProduct: ((Product) -> Void)?
    var didSuccessFetchProduct: VoidClosure?
    var didFailWithError      : StringClosure?
    var cellItems             : [ProductCellViewModel] = []
    var title                 : String?
    private let productService = ProductService()
    
    private var allProducts: [Product] = []
    
    func showProductDetailScreen(at indexPath: IndexPath) {
        let selectedProduct = cellItems[indexPath.row].product
        didSelectProduct?(selectedProduct)
    }
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> ProductCellProtocol {
        return cellItems[indexPath.row]
    }
}

// MARK: - Fetching Products
extension HomeViewModel{
    
    //Fetch All Products
    func fetchProduct() {
        productService.fetchProducts { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let products):
                self.allProducts = products
                self.cellItems = products.map { ProductCellViewModel(product: $0) }
                self.didSuccessFetchProduct?()
            case .failure(let error):
                self.didFailWithError?(error.localizedDescription)
            }
        }
    }
    
    //Fetch Products by Category
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
    
    func filterProducts(with searchText: String) {
        if searchText.isEmpty {
            cellItems = allProducts.map { ProductCellViewModel(product: $0) }
        } else {
            cellItems = allProducts
                .filter { $0.title.lowercased().contains(searchText.lowercased()) }
                .map { ProductCellViewModel(product: $0) }
        }
        didSuccessFetchProduct?()
    }
}
