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
        return CGFloat(150.0)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cartProducts.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCellID", for: indexPath) as! CartTableViewCell
            let product = cartProducts[indexPath.row]
            cell.productNameLabel.text = product.name
            cell.priceLabel.text = "R\(product.price)"
            cell.menuDescriptionLabel.text = product.description
            return cell
        }
}
    
    
    
