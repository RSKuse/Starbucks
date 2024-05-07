//
//  ItemViewController+TableView.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/07.
//

import Foundation
import UIKit


extension ItemViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let InformationCell = tableView.dequeueReusableCell(withIdentifier: "ItemInfoCellID", for: indexPath) as! ItemInfoCell
        return InformationCell
        
    }
    
    
}
