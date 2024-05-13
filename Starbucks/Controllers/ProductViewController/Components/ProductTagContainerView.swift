//
//  ProductTagContainerView.swift
//  Starbucks
//
//  Created by Gugulethu Mhlanga on 2024/05/13.
//

import Foundation
import UIKit

class ProductTagContainerView: UIView {
    
    lazy var tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.regular)
        label.textColor = StarbucksColors.starbucksTextGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 5
        backgroundColor = StarbucksColors.starbucksBackgroundGray
        setupUI()
    }
    
    func setupUI () {
        addSubview(tagLabel)
        tagLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        tagLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
        tagLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tagLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
