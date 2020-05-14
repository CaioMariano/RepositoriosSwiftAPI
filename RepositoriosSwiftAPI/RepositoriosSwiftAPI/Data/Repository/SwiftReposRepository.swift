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
    func getSwiftRepositories(page: Int) -> Promise<SwiftRepositories>
}

class SwiftReposRepository: APIClient, SwiftReposRepositoryProtocol {
    
    func getSwiftRepositories(page: Int) -> Promise<SwiftRepositories> {
        return dispatchRequest(with: SwiftRepositoriesEndpoints.getSwiftRepositories(page: page).request, decodingType: SwiftRepositories.self)
    }
}
