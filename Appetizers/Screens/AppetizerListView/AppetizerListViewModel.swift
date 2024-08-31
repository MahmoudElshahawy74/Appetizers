//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Mahmoud Elshahawy on 18/08/2024.
//

import SwiftUI


@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isloading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    
//    func getAppetizers() {
//        isloading = true  // when it is loading
//       
//        NetworkManager.shared.getAppetizers { result in
//            
//            DispatchQueue.main.async {  // main thread
//                
//                self.isloading = false // when it gets data
//                
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                    
//                case .failure(let error):
//                    
//                    switch error {
//            
//                    case .invalidResponse:
//                        self.alertItem = AlertContext.invalidResponse
//                        
//                    case .invalidURL:
//                        self.alertItem = AlertContext.invalidURL
//                        
//                    case .invalidData:
//                        self.alertItem = AlertContext.invalidData
//                        
//                    case .unableToComplete:
//                        self.alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//         
//        }
//    }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    func getAppetizers() {
        isloading = true  // when it is loading
        
        Task{
            do{
                appetizers = try await NetworkManager.shared.getAppetizers()
                isloading = false // when it gets data
            } catch {
                // it can be handeled without specific errors
                if let apError = error as? AppetizerError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.genericError
                }
                isloading = true
            }
        }
    }
    
    
}
