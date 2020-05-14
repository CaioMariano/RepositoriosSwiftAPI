//
//  RepositoriesViewController+View.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 13/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

import UIKit

extension RepositoriesViewController {
    
    func registerNibs() {
        let repositoryTableViewCell = UINib(nibName: repositoryCellNibName, bundle: nil)
        repositoriesTableView?.register(repositoryTableViewCell, forCellReuseIdentifier: RepositoryTableViewCell.reuseIdentifier)
    }
    
    @objc func refreshData(_ sender: Any) {
        viewModel.loadSwiftRepositories()
        stopRefreshControl()
    }
}
