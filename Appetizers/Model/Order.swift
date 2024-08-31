//
//  Order.swift
//  Appetizers
//
//  Created by Mahmoud Elshahawy on 26/08/2024.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price } // add to total item's prices 
    }
    
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
