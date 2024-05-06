//
//  ProductTableViewCell.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/04/30.
//

import Foundation
import UIKit

class ProductTableViewCell: UITableViewCell {
    
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
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceLabel: UILabel = {
       let label = UILabel()
        label.text = "R48.00 90% (33)"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var menuDescriptionLabel: UILabel = {
       let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05
        label.textColor = StarbucksColors.starbucksBlack // I need to practice
        let attributedString = NSMutableAttributedString(string: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.\n", attributes: [NSAttributedString.Key.kern: -0.1, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        label.attributedText = attributedString
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var productInformationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [productNameLabel,
                                                       priceLabel,
                                                       menuDescriptionLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 1
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // Comment: add the lines in each cell as UIView

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        accessoryType = UITableViewCell.AccessoryType.none
        setupUI()
    }
    
    func setupUI() {
        addSubview(productImageView)
        addSubview(productInformationStackView)      
        
        productImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        productImageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        productImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        productImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        productInformationStackView.leftAnchor.constraint(equalTo: leftAnchor,
                                                          constant: 20).isActive = true
        productInformationStackView.rightAnchor.constraint(equalTo: productImageView.leftAnchor,
                                                           constant: -20).isActive = true
        productInformationStackView.topAnchor.constraint(equalTo: topAnchor,
                                                         constant: 12).isActive = true
        productInformationStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, 
                                                            constant: -12).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


