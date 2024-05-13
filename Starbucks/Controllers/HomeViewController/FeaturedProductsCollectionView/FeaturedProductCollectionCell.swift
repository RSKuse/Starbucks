//
//  FeaturedProductCollectionCell.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/01.
//

import Foundation
import UIKit

class FeaturedProductCollectionCell: UICollectionViewCell {
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "latte")
        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 36
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
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
        view.isHidden = true
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
        productImageView.addSubview(mostLikedView)
        addSubview(productNameLabel)
        addSubview(priceLabel)
        
        productImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        productImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        productImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        mostLikedView.leftAnchor.constraint(equalTo: productImageView.leftAnchor).isActive = true
        mostLikedView.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: -8).isActive = true
        mostLikedView.widthAnchor.constraint(equalToConstant: 74).isActive = true
        mostLikedView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        productNameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        productNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -6).isActive = true
        productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor,
                                              constant: 8).isActive = true
    
        priceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 4).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func likeClickButtonAction() {

    }
    
}

