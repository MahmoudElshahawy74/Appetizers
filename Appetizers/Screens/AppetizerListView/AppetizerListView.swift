//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Mahmoud Elshahawy on 26/08/2024.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
   
   //@State private var appetizers: [Appetizer] = []
    
    var body: some View {
       
        ZStack{
            NavigationView {
                
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                    .navigationTitle("🍟 Appetizers")
                    .listStyle(.plain)
                    .disabled(viewModel.isShowingDetail)
            }
            .task {
                viewModel.getAppetizers()
            }
//            .onAppear{
//                viewModel.getAppetizers()
//            }
            
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!,
                                    isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isloading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            
        }
    }
    }


#Preview {
    AppetizerListView()
}
