//
//  ProductSizeTableCell.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/07.
//

import Foundation
import UIKit

class ProductSizeTableCell: UITableViewCell {
    static var cellID = "ProductSizeTableCellID"
    
    lazy var sizeNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tall"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var priceSizeLabel: UILabel = {
        let label = UILabel()
        label.text = "+R4.00"
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sizePriceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sizeNameLabel, priceSizeLabel])
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var checkMarkButton: UIButton = {
        let button = UIButton()
        let icon = StarbucksImages.checkMarkButton
        button.setImage(icon, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupUI()
    }
    
    func setupUI() {
        addSubview(checkMarkButton)
        addSubview(sizePriceStackView)
        
        
        sizePriceStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        sizePriceStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        checkMarkButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        checkMarkButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
