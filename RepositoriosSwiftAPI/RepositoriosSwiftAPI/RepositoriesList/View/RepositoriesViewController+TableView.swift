//
//  RepositoriesViewController+TableView.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 13/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

import UIKit

extension RepositoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowsInSection()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = setupRepositoryCells(tableView, cellForRow: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.getHeightForRow()
    }
    
    //MARK: - Private Functions
    private func setupRepositoryCells(_ tableView: UITableView, cellForRow indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoryTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setLabelTexts(repositoryName: viewModel.getRepositoryName(index: indexPath.row), repositoryStars: viewModel.getRepositoryStars(index: indexPath.row), ownerName: viewModel.getOwnerName(index: indexPath.row), ownerImage: viewModel.getOwnerImage(index: indexPath.row))
        return cell
    }
    
    
}
