//
//  StarbucksProductStruct.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/02.
//

import Foundation
//import UIKit
//
//struct Product: Codable {
//    var name: String
//    var imageName: String
//    var price: Double
//    var description: String
//    var size: [ProductSize]?
//    var rating: Double = 5.0
//    var numberOfLikes: Int = 0
//    
//    enum CodingKeys: String, CodingKey {
//        case name, imageName, price, description, size, rating, numberOfLikes
//    }
//}
//
//struct ProductSize: Codable {
//    let name: String
//    let price: Double
//    
//    enum CodingKeys: String, CodingKey {
//        case name, price
//    }
//    
//}

import UIKit

struct Product: Codable {
    var name: String
    var imageName: String
    var price: Double
    var description: String
    var size: [ProductSize]?
    var rating: Double = 5.0
    var numberOfLikes: Int = 0
    var allergens: [String]?
    var caffeine: String?
    var nutrition: Nutrition?
    
    enum CodingKeys: String, CodingKey {
        case name, imageName, price, description, size, rating, numberOfLikes, allergens, caffeine, nutrition
    }
}

struct ProductSize: Codable {
    let name: String
    let price: Double
    
    enum CodingKeys: String, CodingKey {
        case name, price
    }
}

struct Nutrition: Codable {
    let calories: Int
    let fat: Int
    let carbs: Int
    let protein: Int
    
    enum CodingKeys: String, CodingKey {
        case calories, fat, carbs, protein
    }
}


