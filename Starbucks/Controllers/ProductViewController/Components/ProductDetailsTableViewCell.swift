//
//  ItemInfoCell.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/07.
//

import Foundation
import UIKit

class ProductDetailsTableViewCell: UITableViewCell {
    
    static var cellID = "ProductDetailsTableViewCellID"
    
    
    lazy var mostlikedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        
        let label = UILabel()
        label.text = "#1 Most Liked"
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.regular)
        label.textColor = StarbucksColors.starbucksTextGray
        label.textAlignment = .center
        
        view.addSubview(label) // Add label as subview to mostlikedView
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
     
        view.backgroundColor = StarbucksColors.starbucksBackgroundGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var numberOflikedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        
        let label = UILabel()
        label.text = "♥︎90% (1k)"
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.regular)
        label.textColor = StarbucksColors.starbucksTextGray
        label.textAlignment = .center
        
        view.addSubview(label) // Add label as subview to mostlikedView
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
     
        view.backgroundColor = StarbucksColors.starbucksBackgroundGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var productNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Latte"
        label.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "R48.00"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var productDescription: UILabel = {
        let label = UILabel()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.0
        label.textColor = StarbucksColors.starbucksTextGray
        let attributedString = NSMutableAttributedString(string: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.\n", attributes: [NSAttributedString.Key.kern: 0.1, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)
        label.attributedText = attributedString
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupUI()
    }
    
    func setupUI() {
        addSubview(mostlikedView)
        addSubview(numberOflikedView)
        addSubview(productNameLabel)
        addSubview(productPriceLabel)
        addSubview(productDescription)
        
        
        mostlikedView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        mostlikedView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        mostlikedView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        mostlikedView.widthAnchor.constraint(equalToConstant: 74).isActive = true
     
        numberOflikedView.leftAnchor.constraint(equalTo: mostlikedView.rightAnchor, constant: 8).isActive = true
        numberOflikedView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        numberOflikedView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        numberOflikedView.widthAnchor.constraint(equalToConstant: 74).isActive = true
        
        productNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        productNameLabel.topAnchor.constraint(equalTo: mostlikedView.bottomAnchor, constant: 15).isActive = true
        
        productPriceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        productPriceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 5).isActive = true
        
        productDescription.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        productDescription.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        productDescription.topAnchor.constraint(equalTo: productPriceLabel.bottomAnchor, constant: 14).isActive = true
        productDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
   


        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

