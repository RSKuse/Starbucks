//
//  StarbucksProductStruct.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/02.
//

import Foundation
import UIKit

struct Product {
    let name: String
    let image: UIImage
    let price: Double
    let description: String
    var size: [ProductSize]?
    var rating: Double = 5.0
    var numberOfLikes: Int = 0
}

struct ProductSize {
    let name: String
    let price: Double
    
}
