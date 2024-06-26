//
//  StarbucksDatabase.swift
//  Starbucks
//
//  Created by Gugulethu Mhlanga on 2024/05/02.
//

import Foundation
import UIKit

class StarbucksDatabase {
    static var cartProducts: [CartModel] = []
    
    
}

/*
    // var categoriesArray: [String] = ["Favourites", "Picked For You", "Bakery", ""]
    
    //**
     Cart Array
     */
    static var cartProducts: [CartModel] = []
    
    /**
     Products Array
     */
    var featuredArray: [Product] {
        let featuredProducts = [Product(name: "Hazelnut Chocolate Croissant®",
                                        image: StarbucksImages.croissant!,
                                        price: 42.49,
                                        description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.",
                                        rating: 4.8,
                                        numberOfLikes: 1690 ),
                                Product(name: "Caramel Macchiato®",
                                        image: StarbucksImages.macchiato!,
                                        price: 54.99,
                                        description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.",
                                        numberOfLikes: 203),
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
                                Product(name: "Mini Salted Caramel Vanilla Cake®",
                                        image: StarbucksImages.vanillaCake!,
                                        price: 79.49,
                                        description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.",
                                        rating: 3.7,
                                        numberOfLikes: 2205),
                                Product(name: "Mini Chocolate Cake®",
                                        image: StarbucksImages.vanillaCake!,
                                        price: 109.29,
                                        description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.",
                                        rating: 4.8,
                                        numberOfLikes: 3000)]
        return featuredProducts.sorted(by: { $0.numberOfLikes > $1.numberOfLikes })
    }
    
    // Comments: Practice Return Statements
    func sortedFeaturedProducts() -> [Product] {
        // Comment: Create Some arrays in playgrounds and use the sorting function to sorted them
        return self.featuredArray.sorted(by: { $0.numberOfLikes > $1.numberOfLikes })
    }
   
    var pickedForYouArray: [Product] {
        [Product(name: "Latte®",
                 image: StarbucksImages.latte!,
                 price: 48.00,
                 description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.",
                 size: [ProductSize(name: "Grande", price: 4.00),
                        ProductSize(name: "Venti", price: 8.00),
                       ]),
  
         Product(name: "Chocolate Chip®",
                 image: StarbucksImages.chocolateChip!,
                 price: 52.00,
                 description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.",
                 size: [ProductSize(name: "Grande", price: 4.00),
                        ProductSize(name: "Venti", price: 8.00),
                       ]),
         Product(name: "Espresso Frappuccino®",
                 image: UIImage(named: "espressoFrappuccino")!,
                 price: 52.00, description: "Dark, rich espresso lies in wait under a smoothed and stretched layer of thick milk foam. An alchemy of barista artistry and craft.")]
    }
    
    var bakeryArray: [Product] {
        [Product(name: "Crossaint®",
                image: UIImage(named: "Hazelnut Chocolate Croissant")!,
                price: 42.00,
                description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream."),
        Product(name: "vanilla cake®",
                image: UIImage(named: "vanilla_cake")!,
                price: 92.00,
                description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.")]
    }
    
    
    var desertsArray: [Product] {
        [Product(name: "vanilla cake®",
                 image: UIImage(named: "vanilla_cake")!,
                 price: 92.00,
                 description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.")]
    }
    
    var specialisedCoffee: [Product] {
        [Product(name: "Chai Latte",
                 image: UIImage(named: "vanilla_cake")!,
                 price: 109.45,
                 description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.",
                size: [ProductSize(name: "Grande", price: 17.00),
                       ProductSize(name: "Venti", price: 29.00),
                      ]),
         Product(name: "Morocan Americano",
                  image: UIImage(named: "vanilla_cake")!,
                  price: 198.45,
                  description: "Mocha syrup and java chips combined with milk, blended with ice and topped with whipped cream.")]
    }
        
        
    var categories: [StarbucksCategoryModel] {
        [StarbucksCategoryModel(name: "Favourites",
                                products: featuredArray),
         StarbucksCategoryModel(name: "Picked For You",
                                products: pickedForYouArray),
         StarbucksCategoryModel(name: "Bakery",
                                products: bakeryArray),
         StarbucksCategoryModel(name: "Deserts",
                                products: desertsArray),
         StarbucksCategoryModel(name: "Specialised Coffees",
                                products: specialisedCoffee)]
                                                    
    }

}
                  
*/

