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
    let image: String
    let cost: Double
    var numberOfItems: Int
    var selectedSize: ProductSize? // Add selectedSize property
}

