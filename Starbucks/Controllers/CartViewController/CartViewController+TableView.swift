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
        cell.productPriceLabel.text = "R\(cartProduct.price)" // Assuming price is a Double

        // Set size name and price if available
        if let sizes = cartProduct.size {
            for size in sizes {
                sizeNameString += "\(size.name)\n"
                priceSizeString += "+R\(size.price)\n"
            }
        }
        
        // Set the selected size's name and price if available
        if let selectedSize = cartProduct.selectedSize {
            sizeNameString = "\(selectedSize.name)\n"
            priceSizeString = "+R\(selectedSize.price)\n"
        }
        
        cell.sizeNameLabel.text = sizeNameString
        cell.priceSizeLabel.text = priceSizeString
        
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
    
