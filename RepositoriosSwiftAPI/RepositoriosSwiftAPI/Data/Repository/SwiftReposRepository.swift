//
//  SwiftRepositoriesRepository.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 12/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

import Foundation
import PromiseKit

protocol SwiftReposRepositoryProtocol: class {
    func getSwiftRepositories() -> Promise<SwiftRepositories>
}

class SwiftReposRepository: APIClient, SwiftReposRepositoryProtocol {
    
    func getSwiftRepositories() -> Promise<SwiftRepositories> {
        return dispatchRequest(with: SwiftRepositoriesEndpoints.getSwiftRepositories.request, decodingType: SwiftRepositories.self)
    }
}
