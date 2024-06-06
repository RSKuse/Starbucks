//
//  StarbucksPriceDecimal.swift
//  Starbucks
//
//  Created by Reuben Simphiwe Kuse on 2024/05/29.
//

import Foundation
import UIKit

class StarbucksPriceDecimal {

    static func currencyFormat(price: Double) -> String {
        return String(format: "R%,2f", price)
    }

}
