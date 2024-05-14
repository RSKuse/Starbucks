//
//  StarbucksDatabase.swift
//  Starbucks
//
//  Created by Gugulethu Mhlanga on 2024/05/02.
//

import Foundation
import UIKit

class StarbucksDatabase {
    
    var categoriesArray: [String] = ["Featured", "Picked For You", "Bakery"]
    
    let featuredArray: [Product] = [
            Product(name: "Hazelnut Chocolate Croissant®",
                    image: StarbucksImages.croissant!,
                    price: 42.49,
                    description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.",
                    rating: 4.8,
                    numberOfLikes: 1690 ),
            Product(name: "Caramel Macchiato®",
                    image: StarbucksImages.macchiato!,
                    price: 54.99,
                    description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.",
                   numberOfLikes: 10654),
            Product(name: "Mini Salted Caramel Vanilla Cake®",
                    image: StarbucksImages.vanillaCake!,
                    price: 79.49,
                    description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.",
                    rating: 3.9,
                   numberOfLikes: 2054),
            Product(name: "Hazelnut Chocolate Croissant®",
                    image: StarbucksImages.croissant!,
                    price: 42.49,
                    description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.",
                    rating: 4.8,
                    numberOfLikes: 1690 ),
            Product(name: "Caramel Macchiato®",
                    image: StarbucksImages.macchiato!,
                    price: 54.99,
                    description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.",
                    size: [ProductSize(name: "Tall", price: 0.0),
                           ProductSize(name: "Venti", price: 4.0),
                           ProductSize(name: "Grande", price: 8.0)],
                    numberOfLikes: 104),
            Product(name: "Mini Salted Caramel Vanilla Cake®",
                    image: StarbucksImages.vanillaCake!,
                    price: 79.49,
                    description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.",
                    rating: 3.7,
                   numberOfLikes: 205),
            Product(name: "Mini Chocolate Cake®",
                    image: StarbucksImages.vanillaCake!,
                    price: 109.29,
                    description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.",
                    rating: 3.8,
                    numberOfLikes: 1347)
            
        ]
    
    // Comments: Practice Return Statements
    func sortedFeaturedProducts() -> [Product] {
        // Comment: Create Some arrays in playgrounds and use the sorting function to sorted them
        return self.featuredArray.sorted(by: { $0.numberOfLikes > $1.numberOfLikes })
    }
    
    let pickedForYouArray: [Product] = [
            Product(name: "Latte®", 
                    image: StarbucksImages.latte!,
                    price: 66.00,
                    description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream."),
            Product(name: "Chocolate Chip®",
                    image: StarbucksImages.chocolateChip!,
                    price: 52.00,
                    description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream."),
            Product(name: "Espresso Frappuccino®",
                    image: UIImage(named: "espressoFrappuccino")!,
                    price: 131.00, description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.")
        ]
    
    let bakeryArray: [Product] = [
            Product(name: "Crossaint®", 
                    image: UIImage(named: "Hazelnut Chocolate Croissant")!,
                    price: 42.00,
                    description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream."),
            Product(name: "vanilla cake®",
                    image: UIImage(named: "vanilla_cake")!,
                    price: 92.00,
                    description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream."),
        ]
    
}
