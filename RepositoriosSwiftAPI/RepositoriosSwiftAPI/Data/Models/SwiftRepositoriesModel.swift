//
//  SwiftRepositoriesModel.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 12/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

import UIKit

struct SwiftRepositories: Codable {
    let items: [SwiftRepositoriesItems]
}

struct SwiftRepositoriesItems: Codable {
    let name: String
    let stars: Int
    let owner: SwiftRepositoriesOwners
    
    enum CodingKeys: String, CodingKey {
        case name, owner
        case stars = "stargazers_count"
    }
}

struct SwiftRepositoriesOwners: Codable {
    let ownerImage, ownerName: String
    
    enum CodingKeys: String, CodingKey {
        case ownerImage = "avatar_url"
        case ownerName = "login"
    }
}
