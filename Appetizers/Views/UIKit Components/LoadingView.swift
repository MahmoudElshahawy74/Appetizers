//
//  LoadingView.swift
//  Appetizers
//
//  Created by Mahmoud Elshahawy on 19/08/2024.
//

import SwiftUI


//struct ActivityIndicator: UIViewRepresentable {
//    
//    func makeUIView(context: Context) -> UIActivityIndicatorView {
//        let activityIndicatorView = UIActivityIndicatorView(style: .large)
//        activityIndicatorView.color = UIColor.brandPrimaryColor
//        activityIndicatorView.startAnimating()
//        return activityIndicatorView
//    }
//    
//    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
//}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
           // ActivityIndicator()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                .scaleEffect(2) // size of spinner loading
        }
    }
}

