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
        
        // Fetch cart product from cartProducts array
        let cartProduct = StarbucksDatabase.cartProducts[indexPath.row]
        
        // Configure cell with cart product data
        cell.productNameLabel.text = cartProduct.name
        cell.productImageView.image = cartProduct.image
        cell.productPriceLabel.text = "\(cartProduct.price)" // Assuming price is a Double
        
        // Set size name and price if available
        if let size = cartProduct.size {
            if let firstSize = size.first {
                cell.sizeNameLabel.text = firstSize.name
                cell.priceSizeLabel.text = "+\(firstSize.price)"
            }
        } else {
            // If size is nil, hide size and price labels
            cell.sizeNameLabel.text = nil
            cell.priceSizeLabel.text = nil
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            StarbucksDatabase.cartProducts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}
    
