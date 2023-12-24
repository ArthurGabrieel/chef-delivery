//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Arthur Gabriel Gomes on 23/12/23.
//

import SwiftUI

struct StoresContainerView: View {
    let title = "Lojas"
    @State private var ratingFilter = 0
    
    var filteredStores: [StoreType] {
        return storesMock.filter { store in
            store.stars >= ratingFilter
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Menu("Filtrar") {
                    Button {
                        ratingFilter = 0
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()
                    ForEach(1...5, id: \.self) { rating in
                        Button {
                            ratingFilter = rating
                        } label: {
                            rating > 1 ?
                            Text("\(rating) estrelas ou mais") :
                            Text("\(rating) estrela ou mais")
                        }
                    }
                }
                .foregroundStyle(.black)
            }
            
            VStack(spacing: 20) {
                if filteredStores.isEmpty {
                    Text("Nenhum resultado encontrado!")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(Color("ColorRed"))
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(filteredStores) { store in
                        NavigationLink(
                            destination: StoreDetailView(store: store),
                            label: {
                                StoreItemView(store: store)
                            })
                    }
                }
                
            }
            .foregroundStyle(.black)
        }
        .padding(.horizontal, 25)
    }
}

#Preview {
    StoresContainerView()
        .previewLayout(.sizeThatFits)
}
