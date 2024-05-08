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
        let label = UILabel()
        label.text = "#1 Most Liked"
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.regular)
        label.textColor = StarbucksColors.starbucksTextGray
        label.textAlignment = .center
        view.backgroundColor = StarbucksColors.starbucksBackgroundGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    lazy var numberOflikedView: UIView = {
        let view = UIView()
        let label = UILabel()
        label.text = "♥︎90% (1k)"
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.regular)
        label.textColor = StarbucksColors.starbucksTextGray
        label.textAlignment = .center
        view.backgroundColor = StarbucksColors.starbucksBackgroundGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    
    lazy var productNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Latte"
        label.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.medium)
        label.textColor = StarbucksColors.starbucksBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "R48.00"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        label.textColor = StarbucksColors.starbucksBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var productDescriptiom: UILabel = {
        let label = UILabel()
        label.text = "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream."
        label.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.regular)
        label.textColor = StarbucksColors.starbucksTextGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        addSubview(mostlikedView)
        addSubview(label)
//        addSubview(numberOflikedView)
//        addSubview(productNameLabel)
//        addSubview(productPriceLabel)
//        addSubview(productDescriptiom)
        
        
        mostlikedView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        mostlikedView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        mostlikedView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        mostlikedView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

