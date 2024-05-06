//
//  MostLikedView.swift
//  Starbucks
//
//  Created by Gugulethu Mhlanga on 2024/05/02.
//

import Foundation
import UIKit

class MostLikedView: UIView {
    
    lazy var mostLikedLabel: UILabel = {
        let label = UILabel()
        label.text = "#1 Most Liked"
        label.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = StarbucksColors.primaryColor
        layer.cornerRadius = 9
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        setupUI()
    }
    
    func setupUI() {
        addSubview(mostLikedLabel)
        
        mostLikedLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mostLikedLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
