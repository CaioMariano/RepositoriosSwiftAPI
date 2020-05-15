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
            
            if 200...299 ~= httpResponse.statusCode {
                if data.isEmpty, let emptyResponse = NoData() as? T {
                    return emptyResponse
                }
                return try JSONDecoder().decode(T.self, from: data)
            }
            throw (try? JSONDecoder().decode(APIResponseError.self, from: data))?.type.standarizedType() ?? ResponseError.withStatusCode(httpResponse.statusCode)
        }).recover({ (error) -> Promise<T> in
            if let apiError = error as? ResponseError { throw apiError }
            throw ResponseError.timeout
        })
    }
}

struct NoData: Decodable {}

