//
//  AdvertCell.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/06.
//

import Foundation
import UIKit

class AdvertCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = StarbucksImages.homeImage
        imageView.layer.cornerRadius = 20.0
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = StarbucksColors.primaryColor
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        addSubview(imageView)
        
        imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 140.0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
