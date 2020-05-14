//
//  SwiftRepositoriesEndpoint.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 12/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

import UIKit

enum SwiftRepositoriesEndpoints: Endpoint {
    case getSwiftRepositories(page: Int)
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .getSwiftRepositories(let page):
            return [URLQueryItem(name: "q", value: "language:swift"),
                    URLQueryItem(name: "sort", value: "stars"),
                    URLQueryItem(name: "page", value: page.description)]
        }
    }
    
    var path: String {
        switch self {
        case .getSwiftRepositories:
            return "/search/repositories"
        }
    }
    
    var request: URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.value
        request.allHTTPHeaderFields = headers
        switch self {
        case .getSwiftRepositories:
            break
        }
        return request
    }
    
    var method: RequestMethod {
        switch self {
        case .getSwiftRepositories:
            return .get
        }
    }
}
