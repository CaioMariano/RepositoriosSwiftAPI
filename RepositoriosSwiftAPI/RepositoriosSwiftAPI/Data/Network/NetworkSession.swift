//
//  NetworkSession.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 12/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

import Foundation
import PromiseKit

class NetwordSession {
    
    private var session: URLSession
    
    init() {
        session = .shared
    }
    
    func buildSession() -> URLSession {
        let config: URLSessionConfiguration = .default
        return .init(configuration: config)
    }
}
