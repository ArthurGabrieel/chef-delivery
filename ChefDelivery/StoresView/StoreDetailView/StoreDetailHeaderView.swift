//
//  StoreDetailHeaderView.swift
//  ChefDelivery
//
//  Created by Arthur Gabriel Gomes on 23/12/23.
//

import SwiftUI

struct StoreDetailHeaderView: View {
    let store: StoreType
    
    var body: some View {
        VStack {
            Image(store.headerImage)
                .resizable()
                .scaledToFit()
            HStack {
                Text(store.location)
                Spacer()
                starsRating
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
        }
    }
    
    private var starsRating: some View {
        ForEach(1...store.stars, id: \.self) { _ in
            Image(systemName: "star.fill")
                .foregroundStyle(.yellow)
                .font(.caption)
        }
    }
}

#Preview {
    StoreDetailHeaderView(store: storesMock[0])
}
