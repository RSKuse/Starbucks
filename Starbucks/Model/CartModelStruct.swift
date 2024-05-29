//
//  CartModelStruct.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/16.
//

import Foundation
import UIKit

struct CartModel {
    let name: String
    let image: UIImage
    let price: Double
    var size: [ProductSize]?
    var selectedSize: ProductSize? // Add selectedSize property
}

