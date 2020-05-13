//
//  APIError.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 12/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

struct APIResponseError: Codable {
    let message: String
}

enum ResponseError: Error {
    
    case api(error: APIResponseError)
    case timeout
    case jsonConversionFailure
    case server
    
    var localizedTitle: String {
        switch self {
        case .jsonConversionFailure:
            return "Error"
        case .api(_):
            return "Request error"
        case .timeout:
            return "Timeout"
        case .server:
            return "Server error"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .jsonConversionFailure:
            return "Internal error"
        case .timeout:
            return "You seem to be offline."
        case .server:
            return "There was an internal error in our servers"
        case .api(let error):
            return error.message
        }
    }
}
