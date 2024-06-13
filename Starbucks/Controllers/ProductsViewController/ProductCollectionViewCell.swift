//
//  ProductCollectionViewCell.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/04.
//

import Foundation
import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static var cellID = "ProductCollectionViewCellID"
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Chocolate Chip Cream ®"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "R48.00 ♥︎90% (1k)"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var mostLikedView: MostLikedView = {
        let view = MostLikedView()
        view.isHidden = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupView()
    }
    
    func setupView() {
        addSubview(productImageView)
        addSubview(mostLikedView)
        addSubview(productNameLabel)
        addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 130),
            
            mostLikedView.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor),
            mostLikedView.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: -8),
            mostLikedView.widthAnchor.constraint(equalToConstant: 74),
            mostLikedView.heightAnchor.constraint(equalToConstant: 18),
            
            productNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            productNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8),
            
            priceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 4),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
