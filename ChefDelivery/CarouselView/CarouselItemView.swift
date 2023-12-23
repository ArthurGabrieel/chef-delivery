//
//  CarouselItemView.swift
//  ChefDelivery
//
//  Created by Arthur Gabriel Gomes on 23/12/23.
//

import SwiftUI

struct CarouselItemView: View {
    let order: OrderType
    
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    CarouselItemView(order: OrderType(id: 1, name: "Restaurantes", image: "brazilian-meal-banner"))
}
