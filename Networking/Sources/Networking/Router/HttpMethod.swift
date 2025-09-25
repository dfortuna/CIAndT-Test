//
//  HttpMethod.swift
//  Networking
//
//  Created by Denis Fortuna on 24/09/25.
//

import Alamofire

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    
    var alamofireMethod: Alamofire.HTTPMethod {
        switch self {
        case .get:
            return Alamofire.HTTPMethod.get
        case .post:
            return Alamofire.HTTPMethod.post
        case .put:
            return Alamofire.HTTPMethod.put
        case .delete:
            return Alamofire.HTTPMethod.delete
        }
    }
}
