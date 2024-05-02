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
        label.text = "Latte"
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceLabel: UILabel = {
       let label = UILabel()
        label.text = "R48.00"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    lazy var likeClickButton: UIButton = {
//        let button = UIButton()
//        let icon = UIImage(named: "like_button_icon")
//        button.setImage(icon, for: .normal)
//        button.imageView?.contentMode = .scaleAspectFit
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    lazy var likePercentageLabel: UILabel = {
       let label = UILabel()
        label.text = "♥︎90%"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var numberOfLikesLabel: UILabel = {
       let label = UILabel()
        label.text = "(1k)"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceTagAndLikesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [priceLabel, likePercentageLabel, numberOfLikesLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 1
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return  stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupView()
    }
    
    func setupView() {
        
        addSubview(productImageView)
        addSubview(productNameLabel)
        addSubview(priceTagAndLikesStackView)
        
        productImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        productImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        productImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80).isActive = true
        productImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        productNameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        productNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -6).isActive = true
        productNameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 6).isActive = true
    

        priceTagAndLikesStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6).isActive = true
        priceTagAndLikesStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        priceTagAndLikesStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        priceTagAndLikesStackView.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 6).isActive = true
            
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func likeClickButtonAction() {

    }
    
}

