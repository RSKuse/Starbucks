//
//  ItemContainerView.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/07.
//

import Foundation
import UIKit

class ItemContainerView: UIView {
    
    var product: Product? {
        didSet {
            itemImageView.image = product?.image
        }
    }
    
    lazy var itemImageView: UIImageView = {
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
    
    
    func setupUI () {
        
        addSubview(itemImageView)
        
        itemImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        itemImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        itemImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        itemImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
