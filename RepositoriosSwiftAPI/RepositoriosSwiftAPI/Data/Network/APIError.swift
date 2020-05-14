//
//  APIError.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 12/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

struct APIResponseError: Codable, Error {
    let type: ResponseErrorType
    
    enum CodingKeys: String, CodingKey {
        case type = "error"
    }
}

struct ResponseErrorType: Codable {
    let code: Int
    let message: String
    
    func standarizedType() -> ResponseError {
        switch code {
        case 400: return .invalidData
        case 403: return .unauthorized
        case 404: return .timeout
        default: return .server
        }
    }
}

enum ResponseError: Error {
    
    case timeout,jsonConversionFailure, server, invalidData, unauthorized
    
    var localizedTitle: String {
        switch self {
        case .jsonConversionFailure:
            return "Error"
        case .timeout:
            return "Timeout"
        default:
            return "There was an internal error in our servers"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .jsonConversionFailure:
            return "Internal error"
        case .timeout:
            return "You seem to be offline."
        default:
            return "There was an internal error in our servers"
        }
    }
    
    static func withStatusCode(_ code: Int) -> ResponseError {
        switch code {
        case 400: return .invalidData
        case 403: return .unauthorized
        case 404: return .timeout
        default: return .server
        }
    }
}
