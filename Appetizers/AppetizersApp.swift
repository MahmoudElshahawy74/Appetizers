//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Mahmoud Elshahawy on 26/08/2024.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
