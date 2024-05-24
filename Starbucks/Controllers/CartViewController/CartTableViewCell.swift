//
//  CartTableViewCell.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/15.
//
import Foundation
import UIKit

class CartTableViewCell: UITableViewCell {
    
    static var cellID = "CartTableViewCellID"
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "latte")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var productNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Espresso Frappuccino®"
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sizeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tall"
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.light)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceSizeLabel: UILabel = {
        let label = UILabel()
        label.text = "+R4.00"
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceSizeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sizeNameLabel,
                                                       priceSizeLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 1
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var productNamePriceSizeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [productNameLabel,
                                                       priceSizeStackView])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 1
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "R48.00"
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        accessoryType = UITableViewCell.AccessoryType.none
        setupUI()
    }
    
    func setupUI() {
        addSubview(productImageView)
        addSubview(priceSizeStackView)
        addSubview(productNamePriceSizeStackView)
        addSubview(productPriceLabel)
        
        productImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        productImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        productImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        productImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    
        productNamePriceSizeStackView.rightAnchor.constraint(equalTo: rightAnchor,
                                                          constant: -20).isActive = true
        productNamePriceSizeStackView.leftAnchor.constraint(equalTo: productImageView.rightAnchor,
                                                           constant: 12).isActive = true
        productNamePriceSizeStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        productPriceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        productPriceLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
