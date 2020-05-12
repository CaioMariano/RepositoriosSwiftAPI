//
//  Endpoint.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 12/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

import Foundation

protocol Endpoint {
    var request: URLRequest { get }
    var method: RequestMethod { get }
    var headers: [String: String]? { get }
    var path: String { get }
    var components: URLComponents { get }
    var host: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    
    var host: String {
        return "api.github.com"
    }
    
    var components: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        components.queryItems = queryItems
        return components
    }
    
    var url: URL {
        guard let url = components.url else {
            fatalError("Error when creating URL")
        }
        return url
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var method: RequestMethod {
        return .post
    }
}
