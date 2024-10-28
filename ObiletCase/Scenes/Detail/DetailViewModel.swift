//
//  DetailViewModel.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 28.10.2024.
//

protocol DetailViewDataSource{
    var productDetail: Product {get}
}

protocol DetailViewEventSource{}

protocol DetailViewProtocol: DetailViewDataSource, DetailViewEventSource{}

final class DetailViewModel: BaseViewModel, DetailViewProtocol{
    var productDetail: Product
    
    init(productDetail: Product){
        self.productDetail = productDetail
    }
}
