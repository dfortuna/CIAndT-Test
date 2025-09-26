//
//  Router.swift
//  Networking
//
//  Created by Denis Fortuna on 24/09/25.
//

import Foundation
import Networking

public enum Router: Requestable {
    case list
    case itemDetail(itemId: String)
    
    public var path: String {
        switch self {
        case .list:
            return "pokemon"
        case .itemDetail(let item):
            let uri = getURI(fromItem: item)
            return "pokemon/\(uri)"
        }
    }
    
    public var baseURL: String {
        return "https://pokeapi.co/api/v2/"
    }
    
    private func getURI(fromItem item: String) -> String {
        return item.replacingOccurrences(of: baseURL + "pokemon/", with: "")
    }
    
    public var method: HTTPMethod {
        switch self {
        case .list, .itemDetail:
            return .get
        }
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case .list, .itemDetail:
            return nil
        }
    }
    
    public var encoding: ParameterEncoding {
        switch self {
        case .list, .itemDetail:
            return .queryString
        }
    }
    
    public var headers: HTTPHeader? {
        switch self {
        case .list, .itemDetail:
            return nil
        }
    }
}
