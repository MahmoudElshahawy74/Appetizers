//
//  AppetizerTabView.swift
//  Appetizers
//
//  Created by Mahmoud Elshahawy on 26/08/2024.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
var body: some View {
    TabView {
        AppetizerListView()
//        Image(systemName: "house")
//        Text("Home")
            .tabItem { Label("Home", systemImage: "house") }
        
        AccountView()
            .tabItem { Label("Account", systemImage: "person") }
        
        OrderView()
            .tabItem { Label("Order", systemImage: "bag") }
            .badge(order.items.count)
    }
    .accentColor(.brandPrimary)
}
}

#Preview {
    AppetizerTabView()
}
