//
//  Router.swift
//  Networking
//
//  Created by Denis Fortuna on 24/09/25.
//

import Foundation
import Alamofire

public enum Router: Requestable {
    case list
    case itemDetail(itemId: String)
    
    public var path: String {
        switch self {
        case .list:
            return "pokemon"
        case .itemDetail(let itemId):
            return "pokemon/\(itemId)"
        }
    }
    
    public var baseURL: String {
        return "https://pokeapi.co/api/v2/"
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
            return URLEncoding.queryString
        }
    }
    
    public var headers: Alamofire.HTTPHeaders? {
        switch self {
        case .list, .itemDetail:
            return nil
        }
    }
}
