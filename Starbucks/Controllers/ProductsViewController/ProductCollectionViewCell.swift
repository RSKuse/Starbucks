//
//  ProductCollectionViewCell.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/04.
//

import Foundation
import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
   
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        // Add any additional styling or configuration
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        // Add any additional styling or configuration
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        // Add any additional styling or configuration
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        // Add any additional styling or configuration
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        // Add UI elements to the cell's contentView
        contentView.addSubview(productImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(descriptionLabel)
        
        // Add constraints for UI elements
        // Example constraints:
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        productImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        // Add constraints for other UI elements
    }
    
    // You may also need a method to configure the cell with product data
    func configure(with product: Product) {
        productImageView.image = product.image
        nameLabel.text = product.name
        priceLabel.text = "Price: \(product.price)"
        descriptionLabel.text = product.description
    }
}

