//
//  TableSectionHeaderView.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/01.
//

import Foundation
import UIKit

class TableSectionHeaderView: UIView {
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    lazy var lineView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor.red
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var requiredView: ProductTagContainerView = {
        let view = ProductTagContainerView()
        view.tagLabel.text = "✓ Required"
        view.isHidden = true
        view.tagLabel.textColor = StarbucksColors.primaryColor
        view.backgroundColor = StarbucksColors.lightPrimaryColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(lineView)
        addSubview(titleLabel)
        addSubview(seeAllButton)
        addSubview(requiredView)
        
        lineView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        seeAllButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        seeAllButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        
        requiredView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        requiredView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        requiredView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
    }
    
    @objc func seeAllButtonTapped() {
        print("See All Tapped")
    }
}

