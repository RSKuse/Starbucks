//
//  MostLikedView.swift
//  Starbucks
//
//  Created by Gugulethu Mhlanga on 2024/05/02.
//

import Foundation
import UIKit

class MostLikedView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = StarbucksColors.primaryColor
        layer.cornerRadius = 9
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner] // practice rounding different parts of the view

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
