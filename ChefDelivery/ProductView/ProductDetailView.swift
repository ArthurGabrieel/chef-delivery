//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Arthur Gabriel Gomes on 23/12/23.
//

import SwiftUI

struct ProductDetailView: View {
    let service = StoreService()
    let product: ProductType
    @State private var productQuantity = 1
    @State private var message = ""
    @State private var showAlert = false
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            Spacer()
            ProductDetailQuantityView()
            Spacer()
            ProductDetailButtonView {
                confirmOrder()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Chef Delivery"), message: Text(message), dismissButton: .default(Text("Ok"), action: {
                    presentationMode.wrappedValue.dismiss()
                }))
            }
        }
    }
    
    func confirmOrder() {
        service.confirmOrder(product: product) { result in
            switch result {
            case .success(let message):
                if let message = message {
                    self.message = "\(message)"
                }
            case .failure(let error):
                print("Error confirming order: \(error.localizedDescription)")
            }
            showAlert = true
        }
    }
}

struct ProductDetailButtonView: View {
    let onButtonClicked: () -> Void
    
    var body: some View {
        Button {
            onButtonClicked()
        } label: {
            HStack {
                Image(systemName: "cart")
                Text("Enviar pedido")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 20))
            .shadow(color: Color("ColorRedDark")
                .opacity(0.5), radius: 10, x: 6, y: 8)
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}
