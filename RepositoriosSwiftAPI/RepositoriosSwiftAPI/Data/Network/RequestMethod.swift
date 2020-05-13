//
//  RequestMethod.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 12/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

import Foundation

enum RequestMethod {
    case post, patch, get, put
    var value: String {
        switch self {
        case .post:
            return "POST"
        case .patch:
            return "PATCH"
        case .get:
            return "GET"
        case .put:
            return "PUT"
        }
    }
}
