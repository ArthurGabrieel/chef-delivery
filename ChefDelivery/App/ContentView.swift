//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Arthur Gabriel Gomes on 23/12/23.
//

import SwiftUI

struct ContentView: View {
    let screenSize = UIScreen.main.bounds
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                    .padding(.horizontal, 15)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView()
                            .frame(width: screenSize.width)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
