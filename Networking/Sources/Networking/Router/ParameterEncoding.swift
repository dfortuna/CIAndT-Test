//
//  ParameterEncoding.swift
//  Networking
//
//  Created by Denis Fortuna on 25/09/25.
//

import Foundation
import Alamofire

public enum ParameterEncoding {

    case queryString
    
    var alamofireParameterEncoding: Alamofire.ParameterEncoding {
        switch self {
        case .queryString:
            return URLEncoding.queryString
        }
    }
}
