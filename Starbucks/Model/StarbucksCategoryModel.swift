//
//  StarbucksCategoryModel.swift
//  Starbucks
//
//  Created by Gugulethu Mhlanga on 2024/06/05.
//

import Foundation

struct Categories: Codable {
    let categories: [StarbucksCategoryModel]
}

struct StarbucksCategoryModel: Codable {
    let name: String
    let products: [Product]
}
