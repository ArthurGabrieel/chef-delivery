//
//  SlideButtonView.swift
//  ChefDelivery
//
//  Created by Arthur Gabriel Gomes on 24/12/23.
//

import SwiftUI

struct SlideButtonView: View {
    @Binding var isAnimating: Bool
    @Binding var showSecondScreen: Bool
    let geometry: GeometryProxy
    
    @State private var buttonOffset: CGFloat = 0
    let buttonHeight: CGFloat = 80
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color("ColorRed").opacity(0.2))
            Capsule()
                .fill(Color("ColorRed").opacity(0.2))
                .padding(8)
            Text("Descubra mais")
                .font(.title2)
                .bold()
                .foregroundStyle(Color("ColorRedDark"))
                .offset(x: 20)
            
            HStack {
                Capsule()
                    .fill(Color("ColorRed"))
                    .frame(width: buttonOffset + buttonHeight)
                Spacer()
            }
            
            HStack {
                ZStack {
                    Circle()
                        .fill(Color("ColorRed"))
                    Circle()
                        .fill(Color("ColorRedDark"))
                        .padding(8)
                    Image(systemName: "chevron.right.2")
                        .font(.system(size: 24))
                        .bold()
                        .foregroundStyle(.white)
                }
                Spacer()
            }
            .offset(x: buttonOffset)
            .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        if gesture.translation.width >= 0 &&
                            buttonOffset <= (geometry.size.width - 60) - buttonHeight {
                            withAnimation(.easeInOut) {
                                buttonOffset = gesture.translation.width
                            }
                        }
                        
                    })
                    .onEnded({ _ in
                        if buttonOffset > (geometry.size.width - 60) / 2 {
                            showSecondScreen = true
                        } else {
                            withAnimation(.easeInOut) {
                                buttonOffset = 0
                            }
                        }
                    })
            )
            
        }
        .frame(width: geometry.size.width - 60, height: buttonHeight)
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : 100)
    }
}
