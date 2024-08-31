//
//  AppetizerButton.swift
//  Appetizers
//
//  Created by Mahmoud Elshahawy on 26/08/2024.
//

import SwiftUI

struct AppetizerButton: View {
    
    let title: LocalizedStringKey // to make specifier with input 
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    AppetizerButton(title: "Test Title")
}
