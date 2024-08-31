
//  Appetizer.swift
//  Appetizers
//
//  Created by Mahmoud Elshahawy on 17/08/2024.
//

import Foundation

// MARK: - Welcome
struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

// MARK: - Appetizer
struct Appetizer: Decodable, Identifiable {
    let carbs, calories: Int
    let imageURL: String
    let id: Int
    let description, name: String
    let protein: Int
    let price: Double
}

// MARK: - Dummy data
struct MockData {
    
    static let sampleAppetizer = Appetizer(carbs: 99, calories: 99, imageURL: "", id: 0001, description: "descreption, its yummy", name: "Test Appetizer", protein: 99, price: 9.99)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    
    
    static let orderItemOne     = Appetizer(carbs: 99, calories: 99, imageURL: "", id: 0001, description: "descreption, its yummy", name: "Test Appetizer 1", protein: 99, price: 9.99)
    
    static let orderItemTwo     = Appetizer(carbs: 99, calories: 99, imageURL: "", id: 0002, description: "descreption, its yummy", name: "Test Appetizer 2", protein: 99, price: 9.99)
    
    static let orderItemThree   = Appetizer(carbs: 99, calories: 99, imageURL: "", id: 0003, description: "descreption, its yummy", name: "Test Appetizer 3", protein: 99, price: 9.99)
    
    static let orderItems       = [orderItemOne, orderItemTwo, orderItemThree]
}

