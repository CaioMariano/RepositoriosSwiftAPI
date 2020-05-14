//
//  RepositoryTableViewCell.swift
//  RepositoriosSwiftAPI
//
//  Created by Caio Araujo Mariano on 13/05/20.
//  Copyright © 2020 Caio Araujo Mariano. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var shadowView: UIView?
    @IBOutlet weak var repositoryName: UILabel?
    @IBOutlet weak var ownerName: UILabel?
    @IBOutlet weak var repositoryStars: UILabel?
    @IBOutlet weak var ownerImage: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    //MARK: Public Functions
    func setLabelTexts(repositoryName: String, repositoryStars: Int, ownerName: String, ownerImage: String) {
        self.repositoryName?.text = repositoryName
        self.repositoryStars?.text = repositoryStars.description
        self.ownerName?.text = ownerName
        self.ownerImage?.loadImage(fromString: ownerImage, withPlaceholder: #imageLiteral(resourceName: "EmptyState"))
    }
    
    //MARK: - Private Functions
    private func setupView() {
        shadowView?.layer.cornerRadius = 4
        shadowView?.layer.shadowOpacity = 0.1
        shadowView?.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowView?.layer.shadowRadius = 8
        shadowView?.layer.shadowColor = UIColor.black.cgColor
        shadowView?.layer.masksToBounds = false
        
        ownerImage?.layer.cornerRadius = 8
    }
}
