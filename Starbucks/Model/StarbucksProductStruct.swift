//
//  StarbucksProductStruct.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/02.
//

import Foundation
import UIKit

struct Product: Codable {
    var name: String
    var image: String
    var price: Double
    var description: String
    var size: [ProductSize]
    var rating: Double = 5.0
    var numberOfLikes: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case name, image, price, description, size, rating, numberOfLikes
    }
}

struct ProductSize: Codable {
    let name: String?
    let price: Double?
    
    enum CodingKeys: String, CodingKey {
        case name, price
    }
}


