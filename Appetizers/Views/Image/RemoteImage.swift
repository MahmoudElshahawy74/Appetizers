//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Mahmoud Elshahawy on 20/08/2024.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) { // urlString is alias of fromURLString, just another name to not confuse
        
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage  else { return }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
           
        }
    }
}


struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        // if we have image from network call, if image is nil we have "food-placeholder" as a default
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}


struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(fromURLString: urlString)
            }
    }
}
