//
//  Requestable.swift
//  Networking
//
//  Created by Denis Fortuna on 24/09/25.
//

import Foundation
import Alamofire

public protocol Requestable {
    var path: String { get }
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var encoding: ParameterEncoding { get }
    var headers: Alamofire.HTTPHeaders? { get }
}
