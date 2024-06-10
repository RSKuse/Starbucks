//
//  CartViewController+TableView.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/15.
//

import Foundation
import UIKit

extension CartViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StarbucksDatabase.cartProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.cellID, for: indexPath) as! CartTableViewCell
        let cartProduct = StarbucksDatabase.cartProducts[indexPath.row]
        
        // Configure cell with cart product data
        cell.productNameLabel.text = cartProduct.name
        cell.productImageView.image = UIImage(named: cartProduct.image)
        cell.productPriceLabel.text = StarbucksPriceDecimal.currencyFormat(price: cartProduct.cost)
        
        // Check if there's a selected size
        if let selectedSize = cartProduct.selectedSize {
            cell.sizeNameLabel.text = "\(selectedSize.name)"
            cell.priceSizeLabel.text = StarbucksPriceDecimal.currencyFormat(price: selectedSize.price)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Remove product from cart
            StarbucksDatabase.cartProducts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            updateTotalAmount()
            updateCartView()
            if let cartTabBarItem = tabBarController?.tabBar.items?[1] {
                if StarbucksDatabase.cartProducts.isEmpty {
                    cartTabBarItem.badgeValue = nil
                } else {
                    cartTabBarItem.badgeValue = "\(StarbucksDatabase.cartProducts.count)"
                }
            }
            
        }
    }
}

