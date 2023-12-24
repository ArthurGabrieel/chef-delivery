//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Arthur Gabriel Gomes on 24/12/23.
//

import SwiftUI

struct HomeView: View {
    @State private var isAnimating = false
    @State private var buttonOffset: CGFloat = 0
    @State private var showSecondScreen = false
    
    let buttonHeight: CGFloat = 80
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundStyle(Color("ColorRed"))
                    .frame(width: isAnimating ? 200 : 0)
                    .position(x: isAnimating ? 50 : -50 ,y: isAnimating ? 100 : -100)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                Circle()
                    .foregroundStyle(Color("ColorRedDark"))
                    .frame(width: isAnimating ? 200 : 0)
                    .position(x: isAnimating ? geometry.size.width - 50 : geometry.size.width + 50,
                              y: isAnimating ? geometry.size.height - 100 : geometry.size.height + 100)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                VStack {
                    HeaderTextView(isAnimating: $isAnimating)
                    ImageView(isAnimating: $isAnimating)
                    
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
                .onAppear {
                    withAnimation(.easeInOut(duration: 1)) {
                        isAnimating = true
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showSecondScreen) {
            ContentView()
        }
    }
}
struct HeaderTextView: View {
    @Binding var isAnimating: Bool
    
    var body: some View {
        Text("Chef Delivery")
            .font(.system(size: 48))
            .fontWeight(.heavy)
            .foregroundStyle(Color("ColorRed"))
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : -40)
        Text("Peça as suas comidas no conforto da sua casa.")
            .font(.title2)
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black.opacity(isAnimating ? 1 : 0))
            .offset(y: isAnimating ? 0 : -40)
    }
}


struct ImageView: View {
    @State private var imageOffset: CGSize = .zero
    @Binding var isAnimating: Bool
    
    var body: some View {
        Image("image")
            .resizable()
            .scaledToFit()
            .padding(isAnimating ? 32 : 92)
            .opacity(isAnimating ? 1 : 0)
            .offset(x: imageOffset.width, y: imageOffset.height)
            .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        withAnimation(.easeInOut) {
                            imageOffset = gesture.translation
                        }
                    })
                    .onEnded({ _ in
                        withAnimation(.easeInOut) {
                            imageOffset = .zero
                        }
                    })
            )
    }
}

#Preview {
    HomeView()
}
