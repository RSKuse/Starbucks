//
//  TotalAmountContainerView.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/16.
//

import Foundation
import UIKit

class TotalAmountContainerView: UIView {
    
    lazy var totalAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Amount:"
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "R0.00"
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var payCheckoutButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pay & Checkout", for: .normal)
        button.setTitleColor(StarbucksColors.starbucksTextGray, for: .normal)
        button.backgroundColor = StarbucksColors.starbucksBackgroundGray
        button.layer.cornerRadius = 8.0
        return button
    }()
    

    
    // comment practice how to write this
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        addSubview(totalAmountLabel)
        addSubview(priceLabel)
        addSubview(payCheckoutButton)
    
        totalAmountLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -4).isActive = true
        totalAmountLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        priceLabel.bottomAnchor.constraint(equalTo: payCheckoutButton.topAnchor, constant: -16).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        payCheckoutButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -32).isActive = true
        payCheckoutButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        payCheckoutButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        payCheckoutButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}

