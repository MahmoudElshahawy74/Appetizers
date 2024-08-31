//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Mahmoud Elshahawy on 18/08/2024.
//

import UIKit



final class NetworkManager {
    
    static let shared = NetworkManager() // singleton
    
    // cache has < key, value >  , in our case key is the image url
    private let cache = NSCache<NSString, UIImage> () // no need to dwownload data every time we make api call, so we make local storage
    
    static let baseURL = "https://seanallen-course-backend.herok uapp.com/swiftui-fundamentals/"
    
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    
    // MARK :-> appetizers api call
    
//    func getAppetizers(completed: @escaping (Result<[Appetizer], AppetizerError>) -> Void) {
//        
//        guard let url = URL(string: appetizerURL) else {
//            completed(.failure(.invalidURL))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//            
//            // just checking of error and response and data is good or not
//            if let _ = error { // _ here to just hold the value of error, we dont need var, just checking
//                completed(.failure(.unableToComplete))
//                return
//            }
//            // here we need var
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 /*that means the http response is good */  else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data  else { // here we need var
//                completed(.failure(.invalidData))
//                return
//            }
//            
//            do{
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                completed(.success(decodedResponse.request))
//                
//            }catch {
//                completed(.failure(.invalidData))
//            }
//            
//        }
//        task.resume()
//    }
//    
    
    func getAppetizers() async throws -> [Appetizer] { // throws here to throw an error if found
        
        guard let url = URL(string: appetizerURL) else {
            throw AppetizerError.invalidURL
        }
                    // we dont use response so that we put (_)
        let (data, _ /* response */) = try await URLSession.shared.data(from: url)
        // data and response are not optional, so we dont need to make checking (guard let or if let )
                   
            do{
                let decoder = JSONDecoder()
                return try decoder.decode(AppetizerResponse.self, from: data).request
            }catch {
                throw AppetizerError.invalidData
            }
            
        }
    
    
    
    // MARK :- image API call
    func downloadImage (fromURLString: String, completed: @escaping (UIImage?) -> Void ){
        
        let cacheKey = NSString (string: fromURLString)
        
        if let image = cache.object(forKey: cacheKey) {  // if we dont have this image  in the cache, then we going to make network call
            completed(image)
            return
        }
        
        guard let url = URL(string: fromURLString ) else {
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else { // check the data and check converting this data to an image
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
    
}
