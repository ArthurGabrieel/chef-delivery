//
//  StoreDetailProductItemView.swift
//  ChefDelivery
//
//  Created by Arthur Gabriel Gomes on 23/12/23.
//

import SwiftUI

struct StoreDetailProductItemView: View {
    let product: ProductType
    
    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .bold()
                
                Text(product.description)
                    .foregroundStyle(.black.opacity(0.6))
                    .multilineTextAlignment(.leading)
                Text(product.formattedPrice)
            }
            Spacer()
            productImage(product)
        }
        .padding()
        .foregroundStyle(.black)
    }
    
    private func productImage(_ product: ProductType) -> some View {
        Image(product.image)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 12))
            .frame(width: 120, height: 120)
            .shadow(color: .black.opacity(0.3), radius: 20, x: 6, y: 8)
    }
}


#Preview {
    StoreDetailProductItemView(product: storesMock[0].products[0])
}
