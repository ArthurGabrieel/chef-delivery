//
//  OrderTypeGridView.swift
//  ChefDelivery
//
//  Created by Arthur Gabriel Gomes on 23/12/23.
//

import SwiftUI

struct OrderTypeGridView: View {
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(minimum: 0, maximum: 90), spacing: 10), count: 2)
    }
    
    var body: some View {
        LazyHGrid(rows: gridLayout, spacing: 15) {
            ForEach(ordersMock) { orderItem in
                OrderTypeView(orderType: orderItem)
            }
        }
        .frame(height: 200)
        .padding(.horizontal, 200)
        .padding(.top, 15)
    }
}

#Preview {
    OrderTypeGridView()
        .previewLayout(.sizeThatFits)
}
