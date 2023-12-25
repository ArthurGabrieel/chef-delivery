//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Arthur Gabriel Gomes on 23/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var stores: [StoreType] = []
    @State var isLoading = true
    
    private let service = StoreService()
    private let screenSize = UIScreen.main.bounds
    
    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                } else {
                    NavigationBar()
                        .padding(.horizontal, 15)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(stores: stores)
                                .frame(width: screenSize.width)
                        }
                    }
                }
            }
        }
        .onAppear {
            getStores()
        }
    }
    
    func getStores() {
        service.fetchData { stores, error in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let stores = stores {
                self.stores = stores
            }
            isLoading = false
        }
    }
}

#Preview {
    ContentView()
}
