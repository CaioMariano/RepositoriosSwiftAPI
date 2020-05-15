//
//  RefreshControl.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 13/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static var refreshControl: UIRefreshControl?
    
    func setupRefreshControl(forTable table: UITableView?, _ selector: Selector) {
        UIViewController.refreshControl = UIRefreshControl()
        UIViewController.refreshControl?.tintColor = #colorLiteral(red: 0.5371566415, green: 0.5371697545, blue: 0.5371627212, alpha: 1)
        table?.refreshControl = UIViewController.refreshControl
        UIViewController.refreshControl?.addTarget(self, action: selector, for: .valueChanged)
    }
    
    func stopRefreshControl() {
        DispatchQueue.main.async {
            UIViewController.refreshControl?.endRefreshing()
        }
    }
}
