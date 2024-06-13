//
//  FeaturedProductCollectionCell.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/01.
//

import UIKit

class FeaturedProductCollectionCell: UICollectionViewCell {
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "latte")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.backgroundColor = .red
        return imageView
    }()
    
    lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
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
        addSubview(mostLikedView)
        addSubview(productNameLabel)
        addSubview(priceLabel)
        
        productImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        productImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
            
        mostLikedView.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor).isActive = true
        mostLikedView.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: -8).isActive = true
        mostLikedView.widthAnchor.constraint(equalToConstant: 74).isActive = true
        mostLikedView.heightAnchor.constraint(equalToConstant: 18).isActive = true
            
        productNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        productNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6).isActive = true
        productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8).isActive = true
            
        priceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 4).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
   
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func likeClickButtonAction() {
        
    }
}
