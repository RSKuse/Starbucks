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
    
    lazy var sizeTallLabel: UILabel = {
       let label = UILabel()
        label.text = "Tall"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sizeGrandeLabel: UILabel = {
       let label = UILabel()
        label.text = "Grande"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sizeVentiLabel: UILabel = {
       let label = UILabel()
        label.text = "Venti \n+R11.00"
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.numberOfLines = 2
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        backgroundColor = .brown
        setupUI()
    }
    
    func setupUI() {
        addSubview(sizeTallLabel)
        addSubview(sizeGrandeLabel)
        addSubview(sizeVentiLabel)
        
        
        sizeTallLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        sizeTallLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        
        sizeGrandeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        sizeGrandeLabel.topAnchor.constraint(equalTo: sizeTallLabel.bottomAnchor, constant: 28).isActive = true
        
        sizeVentiLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        sizeVentiLabel.topAnchor.constraint(equalTo: sizeGrandeLabel.bottomAnchor, constant: 40).isActive = true
        sizeVentiLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
