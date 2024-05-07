//
//  ItemContainerView.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/07.
//

import Foundation
import UIKit

class ItemContainerView: UIView {
    
    lazy var ItemImageView: UIImageView = {
        let imageView = UIImageView()
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
        
        addSubview(ItemImageView)
        
        ItemImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        ItemImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        ItemImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        ItemImageView.heightAnchor.constraint(equalToConstant: 318.0).isActive = true

        
    }
    
}
