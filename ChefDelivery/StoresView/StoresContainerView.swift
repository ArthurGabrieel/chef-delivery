//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Arthur Gabriel Gomes on 23/12/23.
//

import SwiftUI

struct StoresContainerView: View {
    let title = "Lojas"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            VStack(spacing: 20) {
                ForEach(storesMock) { store in
                    StoreItemView(order: store)
                }
            }
        }
        .padding(.horizontal, 25)
    }
}

#Preview {
    StoresContainerView()
        .previewLayout(.sizeThatFits)
}
