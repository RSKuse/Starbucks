//
//  TableSectionHeaderView.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/01.
//

import Foundation
import UIKit

class TableSectionHeaderView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("See All", for:.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        button.setTitleColor(StarbucksColors.primaryColor, for:.normal)
        // button.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(titleLabel)
        addSubview(seeAllButton)
        
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        seeAllButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        seeAllButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    @objc func seeAllButtonTapped() {
        print("See All Tapped")
    }
}

