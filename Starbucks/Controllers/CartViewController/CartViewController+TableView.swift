//
//  CartViewController+TableView.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/15.
//

import Foundation
import UIKit

extension CartViewController {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(120.0)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StarbucksDatabase.cartProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.cellID, for: indexPath) as! CartTableViewCell
        let cartProduct = StarbucksDatabase.cartProducts[indexPath.row]
        
        cell.productNameLabel.text = cartProduct.name
        cell.productImageView.image = cartProduct.image
        cell.productPriceLabel.text = String(format: " R%.2f", cartProduct.price) // Assuming price is a Double
        
        // Initialize size name and price strings
        var sizeNameString = ""
        var priceSizeString = ""
        
        // Check if there's a selected size
        if let selectedSize = cartProduct.selectedSize {
            sizeNameString = "\(selectedSize.name)\n"
            priceSizeString = String(format: " +R%.2f\n", selectedSize.price)
        } else {
            // If no selected size, hide the labels
            cell.sizeNameLabel.isHidden = true
            cell.priceSizeLabel.isHidden = true
            
            // If no selected size, check if there are available sizes
            if let sizes = cartProduct.size, !sizes.isEmpty {
                
                // If sizes are available, populate the strings
                for size in sizes {
                    sizeNameString += "\(size.name)\n"
                    priceSizeString += String(format: " +R%.2f\n", size.price)
                }
            }
        }
        
        // Only set the text if there is a size or selected size
        cell.sizeNameLabel.text = sizeNameString.isEmpty ? nil : sizeNameString
        cell.priceSizeLabel.text = priceSizeString.isEmpty ? nil : priceSizeString
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            StarbucksDatabase.cartProducts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            updateTotalAmount()
        }
    }
}
