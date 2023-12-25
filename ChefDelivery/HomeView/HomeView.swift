//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Arthur Gabriel Gomes on 24/12/23.
//

import SwiftUI

struct HomeView: View {
    @State private var isAnimating = false
    @State private var showSecondScreen = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                BackgroundCircleView(isAnimating: $isAnimating, geometry: geometry)
                VStack {
                    HeaderTextView(isAnimating: $isAnimating)
                    ImageView(isAnimating: $isAnimating)
                    SlideButtonView(isAnimating: $isAnimating, showSecondScreen: $showSecondScreen, geometry: geometry)
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

struct BackgroundCircleView: View {
    @Binding var isAnimating: Bool
    let geometry: GeometryProxy
    
    var body: some View {
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
