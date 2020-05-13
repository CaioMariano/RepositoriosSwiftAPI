//
//  RepositoriesViewModel.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 13/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

import UIKit

protocol RepositoriesViewModelProtocol {
    func loadSwiftRepositories()
    func getNumberOfRowsInSection() -> Int
    func getNumberOfSections() -> Int
    func getRepositoryName(index: Int) -> String
    func getRepositoryStars(index: Int) -> Int
    func getOwnerName(index: Int) -> String
    func getOwnerImage(index: Int) -> String
    func getHeightForRow() -> CGFloat
}

class RepositoriesViewModel: RepositoriesViewModelProtocol {
    
    //MARK: - Properties
    var interactor: SwiftRepositoriesInteractorProtocol
    var swiftRepositories: [SwiftRepositoriesItems]?
    private let numberOfSections = 1
    private let heightForRow = CGFloat(200)
    
    //MARK: - Initialization
    init(interactor: SwiftRepositoriesInteractorProtocol = SwiftRepositoriesInteractor()) {
        self.interactor = interactor
    }
    
    //MARK: - Public Functions
    func loadSwiftRepositories() {
        interactor.getSwiftRepositories().done({ [weak self] (repositories) in
            self?.swiftRepositories = repositories.items
        }).catch { (error) in
            print(error)
        }
    }
    
    func getNumberOfRowsInSection() -> Int {
        let rows = swiftRepositories?.isEmpty != false ? swiftRepositories?.count : 0
        return rows ?? .init()
    }
    
    func getNumberOfSections() -> Int {
        return numberOfSections
    }
    
    func getRepositoryName(index: Int) -> String {
        return swiftRepositories?[index].name ?? .init()
    }
    
    func getRepositoryStars(index: Int) -> Int {
        return swiftRepositories?[index].stars ?? .init()
    }
    
    func getOwnerName(index: Int) -> String {
        return swiftRepositories?[index].owner.ownerName ?? .init()
    }
    
    func getOwnerImage(index: Int) -> String {
        return swiftRepositories?[index].owner.ownerImage ?? .init()
    }
    
    func getHeightForRow() -> CGFloat {
        return heightForRow
    }
}
