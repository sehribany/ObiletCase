//
//  RequestProtocol.swift
//  ObiletCase
//
//  Created by Şehriban Yıldırım on 9.10.2024.
//


//MARK: -RequestProtocol
protocol RequestProtocol{
    var path       : String{ get }
    var method     : RequestMethod { get }
    var parameters : [String: Any] { get }
    var headers    : [String: String] { get }
    var encoding   : RequestEncoding { get }
    var url        : String { get }
}
