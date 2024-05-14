//
//  ProductDisclaimerTableCell.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/07.
//

import Foundation
import UIKit

class ProductDisclaimerTableCell: UITableViewCell {
    
    static var cellID = "ProductDiscalimerTableCellID"
    
    lazy var disclaimerLabel: UILabel = {
       let label = UILabel()
        label.text = "If you have any food allergies or special dietary requirements, please notify the restuarant directly before ordering."
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        label.numberOfLines = 2
        label.textColor = StarbucksColors.starbucksTextGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        addSubview(disclaimerLabel)
        
        disclaimerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        disclaimerLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        disclaimerLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
