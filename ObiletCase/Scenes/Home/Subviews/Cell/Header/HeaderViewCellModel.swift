//
//  HeaderViewModel.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 25.10.2024.
//

public protocol HeaderViewCellDataSource: AnyObject {
    var titleText: String {get}
}

public protocol HeaderViewCellEventSource: AnyObject {}

public protocol HeaderViewCellProtocol: HeaderViewCellDataSource, HeaderViewCellEventSource {}

public final class HeaderViewCellModel: HeaderViewCellProtocol {
    public var titleText: String
    
    public init(titleText: String) {
        self.titleText = titleText
    }
}
