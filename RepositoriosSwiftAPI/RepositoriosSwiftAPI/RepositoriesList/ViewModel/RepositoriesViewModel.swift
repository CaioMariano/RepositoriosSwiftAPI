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
    var delegate: RepositoriesViewModelDelegate? { get set }
}

class RepositoriesViewModel: RepositoriesViewModelProtocol {
    
    //MARK: - Properties
    var interactor: SwiftRepositoriesInteractorProtocol
    var swiftRepositories: [SwiftRepositoriesItems]?
    var delegate: RepositoriesViewModelDelegate?
    private let numberOfSections = 1
    private let heightForRow = CGFloat(180)
    
    //MARK: - Initialization
    init(interactor: SwiftRepositoriesInteractorProtocol = SwiftRepositoriesInteractor(), delegate: RepositoriesViewModelDelegate? = nil) {
        self.interactor = interactor
        self.delegate = delegate
    }
    
    //MARK: - Public Functions
    func loadSwiftRepositories() {
        interactor.getSwiftRepositories().done({ [weak self] (repositories) in
            self?.swiftRepositories = repositories.items
            self?.delegate?.reloadTableView()
        }).catch { (error) in
            print(error)
        }
    }
    
    func getNumberOfRowsInSection() -> Int {
        let rows = swiftRepositories?.isEmpty != false ? 0 : swiftRepositories?.count
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
