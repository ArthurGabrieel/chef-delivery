//
//  NavigationBar.swift
//  ChefDelivery
//
//  Created by Arthur Gabriel Gomes on 23/12/23.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Spacer()
            Button("R. Vergueiro, 3185") {
                
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.black)
            Spacer()
            Button(action: {}) {
                Image(systemName: "bell.badge")
            }
            .font(.title3)
            .foregroundStyle(.red)
        }
    }
}

#Preview {
    NavigationBar()
        .previewLayout(.sizeThatFits)
}
