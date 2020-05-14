//
//  ViewController.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 12/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var repositoriesTableView: UITableView?
    
    //MARK: - Properties
    var repositoryCellNibName = "RepositoryTableViewCell"
    var viewModel: RepositoriesViewModelProtocol = RepositoriesViewModel()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        repositoriesTableView?.delegate = self
        repositoriesTableView?.dataSource = self
        viewModel.delegate = self
        registerNibs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupRefreshControl(forTable: repositoriesTableView, #selector(refreshData(_:)))
        viewModel.loadSwiftRepositories()
    }
}

