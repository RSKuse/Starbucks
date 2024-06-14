//
//  ProfileViewController.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/04/25.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    lazy var customerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
        getStarbucksCustomer()
        addLabel()
        
    }
    
    func addLabel() {
        view.addSubview(customerNameLabel)
        
        customerNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        customerNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func getStarbucksCustomer() {
        
        /**
         - This gets data from the internet and not from a database in your app
         */
        // Asanda's CUstomer ID: 1127777
        // Tim's Customer ID: 1177989
        // Feziwe: 1169574
        var request = URLRequest(url: URL(string: "https://flexpay.kasi.money/flexpay/cards/cardholder?customerId=1877&cardholderId=1169574")!,timeoutInterval: Double.infinity)
        request.addValue("F?bLV/zyqDyU/CXV4hAphZ38urezH=aRspf9j-YZSwycq=C-Ark?19veqC=dW!0Za59Yk2hwnvdtuoGnip-EL8B?hRW-G7V8nrBON0EvRoPnVt0ZuaKeNs5g129T9fGb", forHTTPHeaderField: "X-API-KEY")

        request.httpMethod = "GET"

       URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
           
           // Get Data from Internet and Convert to Structs from Json
           print("🎉 Data Response: \(String(data: data, encoding: .utf8)!)")
           
           /**
            Convert Data from Intenet into StarbucksCustomer struct
            */
        
           do {
               let customer: StarbucksCustomer = try JSONDecoder().decode(StarbucksCustomer.self, from: data)
               
               DispatchQueue.main.async {
                   /*
                   self.customerNameLabel.text = "\(String(describing: customer.cardholder?.title)) \(String(describing: customer.cardholder?.firstName)) \(String(describing: customer.cardholder?.surname))"
                   */
                   
                   if let balance = customer.linkedCards?[0].availableBalance,
                        let customerName = customer.cardholder?.firstName {
                       self.customerNameLabel.text = "\(customerName)'s Balance: \(StarbucksPriceDecimal.currencyFormat(price: balance))"
                   }
                   
               }
               
           } catch {
               
           }
       }.resume()
        
        
        
    }
}
