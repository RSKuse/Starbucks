//
//  AdvertContainerView.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/04/25.
//

import Foundation
import UIKit

class AdvertContainerView: UIView {
    
    //let starbucksColors = StarbucksColors()
    
    lazy var advertImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.image = UIImage(named: "")
        imageView.layer.cornerRadius = 20.0
        imageView.backgroundColor = StarbucksColors.primaryColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI () {
        
        addSubview(advertImageView)
        
        advertImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        advertImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        advertImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        advertImageView.heightAnchor.constraint(equalToConstant: 120.0).isActive = true

        
    }
    
}

