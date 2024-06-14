//
//  StarbucksCustomer.swift
//  Starbucks
//
//  Created by Gugulethu Mhlanga on 2024/06/13.
//

import Foundation

struct StarbucksCustomer: Codable {
    var responseCode, responseMessage: String?
    var cardholder: Cardholder?
    var linkedCards: [LinkedCard]?
}

// MARK: - Cardholder
struct Cardholder: Codable {
    var initials, firstName, surname, title: String?
    var dob, gender, nationality: String?
    var primaryIdentity: PrimaryIdentity?
    var secondaryIdentity: DeliveryAddress?
    var ficaIndicator, languageIndicator, mobile, residenceIndicator: String?
    var residentialStatusCode: String?
    var residentialAddress, postalAddress: AlAddress?
    var deliveryAddress: DeliveryAddress?
    var suitableContactTime: String?
    var otherBankAccount: DeliveryAddress?
}

// MARK: - DeliveryAddress
struct DeliveryAddress: Codable {
}


// MARK: - AlAddress
struct AlAddress: Codable {
    var streetNumber, line1, suburb, city: String?
    var province, postalCode: String?
}

// MARK: - PrimaryIdentity
struct PrimaryIdentity: Codable {
    var type, number, issueDate, issueCountry: String?
}


// MARK: - LinkedCard
struct LinkedCard: Codable {
    var cardID, cardNumber: String?
    var actualBalance, availableBalance: Double?
    var status, primarySecondaryIndicator, maskedCardnumber: String?

    enum CodingKeys: String, CodingKey {
        case cardID = "cardId"
        case cardNumber, actualBalance, availableBalance, status, primarySecondaryIndicator, maskedCardnumber
    }
}
