//
//  ItemViewController+TableView.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/07.
//

import Foundation
import UIKit

extension ProductViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        /*
        if section == 1 {
            return 3
        } else {
            return 1
        }
        */
        
        // Comment: return 3 if section is equal to 1 else return 1
        return section == 1 ? 3 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: ProductDetailsTableViewCell.cellID, for: indexPath) as! ProductDetailsTableViewCell
        case 1:
            let sizeTableViewCell = tableView.dequeueReusableCell(withIdentifier: ProductSizeTableCell.cellID, for: indexPath) as! ProductSizeTableCell
            return sizeTableViewCell
        default:
            return tableView.dequeueReusableCell(withIdentifier: ProductDiscalimerTableCell.cellID, for: indexPath) as! ProductDiscalimerTableCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100
        case 1:
            return 56
        default:
            return 56
        }
    }
    
}
