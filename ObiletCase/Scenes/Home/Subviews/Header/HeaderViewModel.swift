//
//  HeaderViewModel.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 25.10.2024.
//

import Foundation

protocol HeaderViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> HeaderViewCellProtocol
}

protocol HeaderViewEventSource: AnyObject {
    func didSelectHeaderItem(at index: IndexPath)
}

protocol HeaderViewProtocol: HeaderViewDataSource, HeaderViewEventSource {}

final class HeaderViewModel: HeaderViewProtocol {
    private var cellCategories: [HeaderViewCellProtocol] = [
        HeaderViewCellModel(titleText: "electronics"),
        HeaderViewCellModel(titleText: "jewelery"),
        HeaderViewCellModel(titleText: "men's clothing"),
        HeaderViewCellModel(titleText: "women's clothing")
    ]
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellCategories.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> HeaderViewCellProtocol {
        return cellCategories[indexPath.row]
    }
    
    func didSelectHeaderItem(at index: IndexPath) {
        print(index)
    }
}
