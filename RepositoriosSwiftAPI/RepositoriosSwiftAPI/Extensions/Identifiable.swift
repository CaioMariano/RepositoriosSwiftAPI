//
//  Identifiable.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 13/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

import Foundation
import UIKit

protocol Identifiable: class {}

extension Identifiable where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Identifiable {}
