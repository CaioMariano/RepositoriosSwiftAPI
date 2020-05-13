//
//  APIClient.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 12/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

import PromiseKit
import UIKit

private var networkSession: NetworkSession = .init()

protocol APIClient {
    func dispatchRequest<T: Decodable>(with request: URLRequest, decodingType: T.Type) -> Promise<T>
}

extension APIClient {
    
    func dispatchRequest<T: Decodable>(with request: URLRequest, decodingType: T.Type) -> Promise<T> {
        return firstly { networkSession.buildSession().dataTask(.promise, with: request) }.map({ data, response in
            guard let httpResponse = response as? HTTPURLResponse else { throw ResponseError.timeout }
            
            guard 200...299 ~= httpResponse.statusCode else {
                if let apiResponseError = try? JSONDecoder().decode(APIResponseError.self, from: data) {
                    throw ResponseError.api(error: apiResponseError)
                }
                throw ResponseError.server
            }
            
            if let dataDecodable = try? JSONDecoder().decode(DataDecodable<T>.self, from: data).data {
                return dataDecodable
            } else if let data = try? JSONDecoder().decode(T.self, from: data) {
                return data
            } else {
                throw ResponseError.jsonConversionFailure
            }
            
        }).recover({ (error) -> Promise<T> in
            if let apiError = error as? ResponseError { throw apiError }
            throw ResponseError.timeout
        })
    }
}

struct DataDecodable<T: Decodable>: Decodable {
    let data: T
}

